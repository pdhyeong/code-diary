### 문제
스도쿠는 숫자 퍼즐로, 가로 9칸, 세로 9칸으로 이루어져 있는 표에 1부터 9까지의 숫자를 채워 넣는 퍼즐입니다.

퍼즐을 푸는 방법은 아홉 가로줄, 세로줄, 3X3 칸에 1에서 9까지의 숫자를 중복되지 않게 한 번씩만 넣으면 됩니다.

일부 칸이 비어있는 상태인 스도쿠 보드를 입력받아 스도쿠 퍼즐이 완성된 보드를 리턴해야 합니다.

-------------------------------------

### 입력
인자 1 : board

가로 길이(board[i].length)와 세로 길이(board.length)가 모두 9인 2차원 배열

matrix[i][j]는 1 이상 9 이하의 자연수

---------------------------------------

### 출력

가로와 세로의 길이가 모두 9인 2차원 배열을 리턴해야 합니다.

#### 주의사항

입력으로 주어지는 board를 직접 수정해도 상관없습니다.

입력으로 주어지는 board 가지고 완성시킬 수 있는 보드는 유일(unique)합니다.

숫자가 입력되지 않은 칸은 편의상 0이 입력되어 있습니다.

-----------------------------------------

### 입출력 예시
```JS
let board = [
  [0, 3, 0, 2, 6, 0, 7, 0, 1],
  [6, 8, 0, 0, 7, 0, 0, 9, 0],
  [1, 9, 0, 0, 0, 4, 5, 0, 0],
  [8, 2, 0, 1, 0, 0, 0, 4, 0],
  [0, 0, 4, 6, 0, 2, 9, 0, 0],
  [0, 5, 0, 0, 0, 3, 0, 2, 8],
  [0, 0, 9, 3, 0, 0, 0, 7, 4],
  [0, 4, 0, 0, 5, 0, 0, 3, 6],
  [7, 0, 3, 0, 1, 8, 0, 0, 0],
];
let output = sudoku(board);
console.log(output); // -->
/* 
[
  [4, 3, 5, 2, 6, 9, 7, 8, 1],
  [6, 8, 2, 5, 7, 1, 4, 9, 3],
  [1, 9, 7, 8, 3, 4, 5, 6, 2],
  [8, 2, 6, 1, 9, 5, 3, 4, 7],
  [3, 7, 4, 6, 8, 2, 9, 1, 5],
  [9, 5, 1, 7, 4, 3, 6, 2, 8],
  [5, 1, 9, 3, 2, 6, 8, 7, 4],
  [2, 4, 8, 9, 5, 7, 1, 3, 6],
  [7, 6, 3, 4, 1, 8, 2, 5, 9],
];
 */
```

----------------------------------------

### CODE
```JS
const sudoku = function (board) {
  const N = board.length;
  const boxes = [
    [0, 0, 0, 1, 1, 1, 2, 2, 2],
    [0, 0, 0, 1, 1, 1, 2, 2, 2],
    [0, 0, 0, 1, 1, 1, 2, 2, 2],
    [3, 3, 3, 4, 4, 4, 5, 5, 5],
    [3, 3, 3, 4, 4, 4, 5, 5, 5],
    [3, 3, 3, 4, 4, 4, 5, 5, 5],
    [6, 6, 6, 7, 7, 7, 8, 8, 8],
    [6, 6, 6, 7, 7, 7, 8, 8, 8],
    [6, 6, 6, 7, 7, 7, 8, 8, 8],
  ];
  const getBoxNum = (row, col) => boxes[row][col];

  const blanks = [];
  const rowUsed = []; // 열별로 들어가 이쓴 숫자
  const colUsed = [];// 행별로 들어가있는 숫자
  const boxUsed = [];// 박스별로 들어가 있는 숫자

  for (let row = 0; row < N; row++) {
    rowUsed.push(Array(N + 1).fill(false)); // i번 행에 j가 들어가있는가?
    colUsed.push(Array(N + 1).fill(false)); // i번 열에 j가 들어가 있는가? 
    boxUsed.push(Array(N + 1).fill(false));// i번 박스에 j가 들어가있는가?
  }

  for (let row = 0; row < N; row++) { 
    for (let col = 0; col < N; col++) { 
      if (board[row][col] === 0) { // 만약 0인경우
        blanks.push([row, col]); // blank에 값을 채운다.
      } else {
        const num = board[row][col]; // 해당 값
        const box = getBoxNum(row, col); // box의 해당 값
        rowUsed[row][num] = true;
        colUsed[col][num] = true;
        boxUsed[box][num] = true;
      }
    }
  }

  const isValid = (row, col, num) => { // 방문처리
    const box = getBoxNum(row, col);
    return (
      rowUsed[row][num] === false &&
      colUsed[col][num] === false &&
      boxUsed[box][num] === false
    );
  };

  const toggleNum = (row, col, num) => { // 
    const box = getBoxNum(row, col);
    board[row][col] = num;
    rowUsed[row][num] = !rowUsed[row][num];
    colUsed[col][num] = !colUsed[col][num];
    boxUsed[box][num] = !boxUsed[box][num];
  };

  const aux = (idx, blanks) => {
    if (idx === blanks.length) {
      return true;
    }

    const [row, col] = blanks[idx];
    for (let num = 1; num <= 9; num++) { // 1부터 9까지 넣어서 비교
      if (isValid(row, col, num) === true) { //방문처리가 됐다면
        toggleNum(row, col, num); // 값 반전
        if (aux(idx + 1, blanks) === true) { 
          return true;
        }
        toggleNum(row, col, num); // 값 반전
      }
    }
    return false;
  };

  aux(0, blanks);
  return board;
};
```

웰노운 알고리즘이라 솔직히 관심도 안가지고 있다가 막상 보니까 멘탈 깨졌다 ㅋㅋㅋㅋㅋㅋ 백트래킹은 보지도 않았다가 넘어간 후폭풍을 여기서 맞았다 ㅠ....

이해는 가는데 다시 풀라고하면 절대 못풀거같다. 내꺼로 만드려고 이론책이랑 다시 꺼내야겠다.....
