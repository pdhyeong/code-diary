### Page나누기

Database에서 Page를 나누는 것은 생각보다 간단하다.

웬만한 일반적인 페이지들은 10페이지가 기본 값으로 되어있다.

```mysql
SELECT * from nft n WHERE reg_dt <= ? order by reg_dt DESC limit 10;
```
와 같이 사용할 수 있다.

10개의 데이터만을 Database에서 추출하여 backend에서 데이터를 응용하는 것이다.

나의 프로젝트 파일에서는 다음과 같이 쿼리함수들을 사용했다.

```JS
// Execute 함수
const pool = require("./MySQL");


// 쿼리 실행 함수
async function execute(query, param) {

    let conn;
    try {
        conn = await pool.getConnection(async conn => conn);
        
        await conn.beginTransaction();
    
        // 쿼리 실행 후 결과물 반환
        const res = await conn.query(query, param).then((res) => {
            return res;
        });

        conn.commit();

        // 쿼리결과에 따라 true/false 반환
        if (res) {
            return res;
        } else {
            return false;
        }
    } catch (error) {
        console.log(error);
    } finally {
        if (conn != undefined) {
            // conn이 정상적으로 커넥션을 받아 왔다면 반환
            conn.release();
        }
    }

}

module.exports = execute;
```

MySql 함수

```JS
const mysql = require('mysql2/promise');

// mysql 커넥션 풀 생성
const pool = mysql.createPool({
    host: 'localhost',
    user: 'root',
    database: 'project1',
    waitForConnections: true,
    connectionLimit: 10,
    queueLimit: 0
});

async function DBInit() {
    // 디비 생성
    await pool.query("CREATE DATABASE if not exists project1");
    
    // 테이블 생성
    await pool.query(`
    CREATE TABLE if not exists user
    (
        id int NOT NULL AUTO_INCREMENT,
        user_address varchar(255),
        user_nickname varchar(255),
        reg_dt datetime,
        PRIMARY KEY (id)
    )
    ;
    `);
}

DBInit();

module.exports = pool;
```

함수로 이용할 쿼리문 모음

```JS
const query = {
    "GET_USER":"SELECT * FROM user WHERE user_address = ?;",
    "INSERT_USR":"INSERT INTO user (user_address, user_nickname, reg_dt) VALUES (?, ?, NOW());",
    "GET_NFT_BY_ADDRESS" : "SELECT * FROM nft WHERE owner_address = ?;",
    "INSERT_NFT" : `
        INSERT INTO nft 
        (
            creator_address, 
            owner_address,
            nft_name,
            nft_detail,
            nft_image,
            nft_price,
            reg_dt,
            upt_dt
        )
        VALUES
        (
            ?,
            ?,
            ?,
            ?,
            ?,
            ?,
            NOW(),
            NOW()
        );

    `,
    "SELECT_LIMIT_10P" : `
        SELECT * from nft n 
        WHERE reg_dt <= ?
        order by reg_dt DESC 
        limit 10
        ;
    `,
    "GET_NFT_BY_ID" : "SELECT * FROM nft WHERE id = ?;",
    "GET_NFT_LIST_FROM_CREATOR":"SELECT * FROM nft WHERE creator_address = ?;",
    "GET_NFT_LIST_FROM_OWNER":"SELECT * FROM nft WHERE owner_address = ?;",
};

module.exports = query;
```

address와 nickname으로만 post 요청을 한다고 가정했을때 

```JS
const execute = require("./../database/ExecuteQuery")
const query = require("./../database/Query");


module.exports = {
    // 회원가입
    signup : async (req,res) => {
        const address = req.body.user_address;
        const nickname = req.body.nickname;
        
        let result = await execute(query.GET_USER, address);
        
        if (result) {
            if(result[0].length === 0 ) {
                console.log('insert user');
                result = await execute(query.INSERT_USR, [address, nickname]);
                if(result) {
                    res.send(result)
                } else {
                    res.send("not enough")
                }
            } else {
                res.send(result[0]);    
            }
        }
        else {
            res.status(500).send("ERROR");
        }
    }
}
```


처럼 만들 수 있다.
