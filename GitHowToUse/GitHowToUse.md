# Github How To Use

## I. 기본 명령어

* git init

  * 새로운 local repository 생성

* git add

  * 변경된 파일을 storage에 추가

* git commit

  * add한 파일을 local repository에 저장

* git log

  * commit 현황 표시

* git push

  - local repository를 remote repository에 업로드

* mv [파일명.md] [폴더명]

  * 해당 폴더로 파일 이동


## II. Github에 소스코드 올리기(최초)

### 1 ) git 창에서 소스코드 폴더로 이동

``` 
- 명령어 : cd 폴더경로  
-  ex) cd TIL
```

### 2)  해당 폴더에 git이 추적할 수 있도록 .git 폴더 생성

### (local repository 생성)

``` 
- 명령어 :  git init
```

### 3) git이 버전관리 대상 파일 상태 파악

``` 
- 명령어 : git status
```

### 4) 버전 관리 파일 추가

``` 
- 명령어 : git add [파일명]
- 모든 파일 추가 명령어 : git add .
```

### 5) commit 메시지 작성

``` 
- 명령어 : git commit -m "메시지 내용"
```

### 6) remote repository 등록

``` 
- 명령어 : git remote add origin [주소]
- ex) git remote add origin https://github.com/gwang920/TIL.git
   (repository 생성시 참고)
```

### 7) commit 한 내용을 remote repository에 push(업로드)

``` 
- 명령어 : git push origin master ( or git push -u origin master)
```



## III. 실시간 코드 업로드 및 수정

* 최초 소스 코드를 업로드 하고 난 후, 위의 과정 일부 생략 가능

``` 
- 명령어 : git add .
		  git commit -m "메시지 내용"
		  git push origin master(브랜치명)
```





* 참고 사이트 : <https://victorydntmd.tistory.com/53>



### IIII. Branch

- 최종 저장폴더로 이동 ex) cd TIL

- git init  입력

  ```
  Initialized empty Git repository in C:/Users/student/.git/
  ```

- git 에 내가 누군지 알려주기

  ```
  git config --global user.email "you@example.com"
  git config --global user.name "Your Name"

  ```

- 원격저장소 연동하기

  ```
  git remote add origin https://github.com/gwang920/TIL.git
  ```

- 응답이 없으면

  ```
  git branch --set -upstream-to=origin/master master
  ```

  

### IIIII. Clone (다른 컴퓨터로 master change)

* git clone https://github.com/gwang920/TIL.git

  clone만 해주면 자동으로 전환됨 (for git pull)

  clone 시에는 User 폴더 밑에 저장소를 생성하자

  => User 폴더 밑에 생성되면 경로가 ~/폴더명 이된다.

  그 이외에는 full path가 표시된다.  ex) ~/c/사용자/폴더명

* git config --global user.name "gwang920"

* git config --global user.email "gwang92@naver.com"

  

  

  

  ##### * 빠져나오기 - esc키를 누른다음 [:wq]

  

### 오류 참고

``` 
1) index.lock : $ git add 190523/fatal: Unable to create 'C:/Users/gwangguen/TIL/.git/index.lock': File exists.

=> "rm -f ./.git/index.lock" 입력 (lock 파일을 제거하여 원복)

2) 중복접근(?)오류 : ! [rejected]        master -> master (fetch first)

=> "git push -f origin master" 입력 (주의사항 : 모든 업로드 파일이 삭제 된다.)

3) [git] commit or discard the untracked or modified content in submodules

=> sub 모듈이 겹쳐서 나는 에러다. find -name ".git" 명령어를 입력하고, 모듈을 삭제해주자
(삭제 명령어 rm -rf 파일명)

4) [GIT err]! [rejected] master -> master (fetch first)

 기존 데이터 손실을 막기위해 push 할 때 발생하는 에러다.
 
 이를 강제로할 수 있다 => git push origin +master
 (단, backup 데이터가 저장되어 있을 때 혹은 지금 push 하는 내용으로 원격저장소 renewal 되어도 상관 없을 때만 실행하자)
```



 

