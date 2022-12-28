```JS
const execute = require("./../database/ExecuteQuery")
const query = require("./../database/Query");

module.exports = {

    // localhost/images?path ={파일이름}
    // 파일 이름 = DB 에다가
    // 어떤거 필요할지 1~10이거 11~20어떻게 가져올건지
    // 생각한 데이터가 어떤형식이면 될지
    // 프론트에서 넘어올건 reg_dt인데 비어있을경우 ,있을경우, 없으면 어떤 쿼리를 날린건지, 분기점을 만들어 보기....

    // 분기를 어떻게 잡을 것인가?
    // 시간으로 
    // 1 ~ 10 다음 은 11~20이 어떻게 나올것 인가? 
    pagenation : async (req,res,next) => {

        //1 ~ 10까지 다음 페이지에서는 10받고 이를 1로 자리에 넣으면 11 ~ 20이
        // SELECT * FROM fnt where id > ? limit 10;,



        // 홈페이지를 눌렀을때 마지막 아이디는 10 return 해야할 아이디 같은 1~10
        // 11~20, 21~30,
        // id = 0 ~ 10 

        const id = req.query.id;
        
        // 자연스럽게 파라미터에 넣어줄 경우

        if(id) {

            let result = await execute("SELECT * FROM nft where id > ? limit 10;",id);

            if(result[0].length !== 0 && id >= 0){
                res.send(result[0]);
            }
            else {
                res.send("Retrieving invalid data.");
            }
        }
        else {
            res.status(500).send("Error not having id");
        }
        // 다음페이지를 미리 가져오는 사이트가 있음...
        // 요청에 맞게 디비에도 요청하고, 갯수를 줄이고, 
        
        // 모든 데이터를 한번에 슬라이스 하기

        const id = req.query.id;

        const result = [];

        let sub = await execute("SELECT * FROM nft where id > ?;",id);

        let count = sub[0].length;
    
        for(let i = 0;i<count;i+=10){
            let searchid = await execute("SELECT * FROM nft where id > ? limit 10;",i);
            if(searchid[0].length !== 0 && i >= 0){
                result.push(searchid[0]);
            }
            else {
                res.send("Retrieving invalid data.");
            }
        }
        res.send(result);
    }
}
```
