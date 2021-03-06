# -알고리즘

# 1. 시뮬레이션 vs 완전탐색

```
- 시뮬레이션은 문제에서 주어진 내용을 코드로서 작성하는 것
따라서 '이러한 과정을 거쳤을 때 나오는 결과값이 무엇인가?'에 대한 대답을 코드로 작성하는 것이라 할 수 있다.

- 완전탐색은 문제에서 과정이 주어지지 않고 결과값을 도출해내는 것.
시뮬레이션과는 다르게 과정이 주저이지 않으며 '가장 좋은 결과는 무엇인가?'에 대한 답을 코드로 작성하는 것이다.
```



# [정렬 알고리즘]

# 1. 선택정렬

```c++
이중포문
    
첫번째 원소부터 탐색하며 최소값을 찾는다.
이때, 최소값과 첫원소를 바꿔준다.
두번째 원소부터 탐색하며 최소값을 찾는다.
마찬가지로 최소값과 두번째 원소를 바꿔준다.
    
첫 루프가 돌면 가장 작은 값이 맨 앞으로
두번째 루프가 돌면 두 번째값이 두 번째 자리로
.
.
.
맨 마지막 루프까지 돌면 오름차순 정렬이 완료됨
시간복잡도 O(N^2)
    
탐색 횟수(자료 이동 횟수)가 고정적이므로
    항상 시간복잡도는 O(N^2)이다.

void selection_sort(int list[], int n){
  int i, j, least, temp;

  // 마지막 숫자는 자동으로 정렬되기 때문에 (숫자 개수-1) 만큼 반복한다.
  for(i=0; i<n-1; i++){
    least = i;

    // 최솟값을 탐색한다.
    for(j=i+1; j<n; j++){
      if(list[j]<list[least])
        least = j;
    }

    // 최솟값이 자기 자신이면 자료 이동을 하지 않는다.
    if(i != least){
        SWAP(list[i], list[least], temp);
    }
  }
}
```

# 2. 삽입정렬

```c++
카드섞기와 같다(?)

1) key값을 두번째 원소부터 ~마지막 원소까지 설정한다.
2) key-1 번 인덱스부터 첫번째 인덱스까지 해당 원소와 key값을 비교하며 정렬해간다.
	key 값보다 작다면 key 값과 해당 원소값을 바꿔준다.

void insertion_sort(int list[], int n){
  int i, j, key;

  // 인텍스 0은 이미 정렬된 것으로 볼 수 있다.
  for(i=1; i<n; i++){
    key = list[i]; // 현재 삽입될 숫자인 i번째 정수를 key 변수로 복사

    // 현재 정렬된 배열은 i-1까지이므로 i-1번째부터 역순으로 조사한다.
    // j 값은 음수가 아니어야 되고
    // key 값보다 정렬된 배열에 있는 값이 크면 j번째를 j+1번째로 이동
    for(j=i-1; j>=0 && list[j]>key; j--){
      list[j+1] = list[j]; // 레코드의 오른쪽으로 이동
    }

    list[j+1] = key;
  }
}

시간복잡도
best case O(N) 이동없이 1번의 루프만 돈다.
worst case O(N^2) 각 루프마다 이동 발생
```

# 3. 버블정렬

```c++
서로 인접한 두 원소를 검사하여 정렬하는 알고리즘
순차적으로 두개의 레코드를 비교하며 크기 순서대로 정렬한다.

void bubble_sort(int list[], int n){
  int i, j, temp;

  for(i=n-1; i>0; i--){
    // 0 ~ (i-1)까지 반복
    for(j=0; j<i; j++){
      // j번째와 j+1번째의 요소가 크기 순이 아니면 교환
      if(list[j]<list[j+1]){
        temp = list[j];
        list[j] = list[j+1];
        list[j+1] = temp;
      }
    }
  }
}

시간복잡도 O(N^2)
```

# 4. 쉘 정렬

```c++
삽입정렬을 보완한 알고리즘
삽입정렬이 어느정도 정렬이 된 배열에서는 굉장히 빠른 것에 착안한 알고리즘이다.
삽입정렬을 최대 문제점 : 요소들이 삽입 될 때 이웃한 위치로만 이동한다.
=> 만약 삽입되어야 할 위치가 현재 위치에서 상당히 멀리떨어져있다면 많은 이동을 거쳐야한다.

쉘 정렬은 삽입 정렬과 다르게 한번에 전체 배열을 정렬하지 않는다.

쉘 정렬 과정
1) 먼저 정렬해야 할 리스트를 일정한 기준에 따라 분류한다.
2) 연속적이지 않은(정렬되지 않은) 여러 개의 부분리스트를 생성한다.
3) 각 부분리스트를 삽입 정렬을 통해 정렬한다.
4) 모든 부분리스트가 정렬되면 다시 더 작은 단위로 2) 번의 과정을 진행한ㄴ다.
5) 위의 과정을 부분리스트가 1이 될 때 까지 반복한다.


장점
1) 연속되지 않은 부분 리스트에서 자료의 교환이 일어나면 "더 큰 거리를" 이동한다.
  => 이웃한 위치로만 이동하는 삽입정렬의 단점을 보완할 수 있다.
  즉, 삽입정렬보다 정렬 된 최종 위치에 있을 가능성이 높다.
2) 쉘 정렬은 결국 부분리스트의 개수가 1일 떄 삽입 정렬을 반복하지만, 
 부분리스트로 미리 어느정도 분류를 했기에 삽입 정렬보다 훨씬 우수하다.
 
시간복잡도
best N
avg n^1.5
worst n^2

ex)
[10 4 7 3 9 6 5 13 2 1 8 12 11 14] 을 쉘 정렬 알고리즘으로 정렬해보자.

우선, 부분리스트를 7을 기준으로 나누어보자

```



| 10   |      |      |      |      |      |      | 13   |      |      |      |      |      |      |
| ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- |
|      | 4    |      |      |      |      |      |      | 2    |      |      |      |      |      |
|      |      | 7    |      |      |      |      |      |      | 1    |      |      |      |      |
|      |      |      | 3    |      |      |      |      |      |      | 8    |      |      |      |
|      |      |      |      | 9    |      |      |      |      |      |      | 12   |      |      |
|      |      |      |      |      | 6    |      |      |      |      |      |      | 11   |      |
|      |      |      |      |      |      | 5    |      |      |      |      |      |      | 14   |

[1회차 정렬 전]

```
이제 K=7로 나누어진 부분리스트를 삽입 정렬로 정렬해보자
```

| 10   |      |      |      |      |      |      | 13   |      |      |      |      |      |      |
| ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- |
|      | 2    |      |      |      |      |      |      | 4    |      |      |      |      |      |
|      |      | 1    |      |      |      |      |      |      | 7    |      |      |      |      |
|      |      |      | 3    |      |      |      |      |      |      | 8    |      |      |      |
|      |      |      |      | 9    |      |      |      |      |      |      | 12   |      |      |
|      |      |      |      |      | 6    |      |      |      |      |      |      | 11   |      |
|      |      |      |      |      |      | 5    |      |      |      |      |      |      | 14   |

[1회차 정렬 후]

```
1회차 정렬 후 배열은 [10 2 1 3 9 6 5 13 4 7 8 12 11 14] 가 된다.

이제 k=3으로 설정하고 부분리스트를 생성하고 다시 정렬하자
```

| 10   |      |      | 3    |      |      | 5    |      |      | 7    |      |      | 11   |      |
| ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- |
|      | 2    |      |      | 9    |      |      | 13   |      |      | 8    |      |      | 14   |
|      |      | 1    |      |      | 6    |      |      | 4    |      |      | 12   |      |      |

[2회차 정렬 전]

| 3    |      |      | 5    |      |      | 7    |      |      | 10   |      |      | 11   |      |
| ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- |
|      | 2    |      |      | 8    |      |      | 9    |      |      | 13   |      |      | 14   |
|      |      | 1    |      |      | 4    |      |      | 6    |      |      | 12   |      |      |

[2회차 정렬 후]

```
2회차 정렬 후 배열은 [3 2 1 5 7 9 6 10 13 12 11 14] 가 된다.

이제 k=2로 설정하고 부분리스트를 생성하고 정렬하자.
```

| 3    |      | 1    |      | 8    |      | 7    |      | 6    |      | 13   |      | 11   |      |
| ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- |
|      | 2    |      | 5    |      | 4    |      | 9    |      | 10   |      | 12   |      | 14   |

[3회차 정렬 전]

| 1    |      | 3    |      | 6    |      | 7    |      | 8    |      | 11   |      | 13   |      |
| ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- |
|      | 2    |      | 4    |      | 5    |      | 9    |      | 10   |      | 12   |      | 14   |

[3회차 정렬 후]

```
3회차 정렬 후 배열은 [1 2 3 4 6 5 7 9 8 10 11 12 13 14] 가 된다.

이제 마지막으로 K=1일 때 정렬을 해주면 쉘 정렬로 배열 정렬이 완료된다.

[1 2 3 4 5 6 7 8 9 10 11 12 13 14]
```



# 5. 합병정렬

```
분할정복 알고리즘 중 하나이다.
분할 정복은 문제를 두 개의 문제로 분할하고 각각을 해결한 다음 결과를 모아서 원래 문제를 해결하는 방법이다.
분할 정복 방법은 대개 순환 호출을 이용하여 구한다.


시간복잡도
nlog(n)

1) 순환호출의 깊이(합병 단계의 수) log(n)

 => 레코드의 수 n이 2의 제곱이라 가정(n=2^k) 라하면 
 2^3 -> 2^2 -> 2^1 -> 2^0 순으로 줄어들어 순환 호출의 깊이가 3임을 알 수 있다.
 이것을 일반화하면 n=2^k -> k=log(n)임을 알 수 있다.

2) 각 합병 단계의 비교 연산
 
  배열의 크기를 8이라 가정하자.
 
  크기가 1인 부분배열 2개를 합병하는데 최대 2번의 연산이 필요하다.
  이때 부분 배열의 쌍이 4이므로 2x4=8번의 연산이 필요하다.

  그 다음 합병과정인 크기가 2인 부분배열 2개를 합병하는데 최대 4번의 연산이 필요하다.
  이때 부분 배열의 쌍이 2이므로 4x2=8번의 연산이 필요하다.
  
  마지막으로 크기가 4인 부분배열 2개를 합병하는데 최대 8번의 연산이 필요하다.
  이때 부분배열의 쌍은 1이므로 1x8=8번의 연산이 필요하다.
  
  따라서, 하나의 합병 단계마다 최대 n(=8)번의 비교연산을 하게된다.
  
  
  1) + 2) 에 따라 시간복잡도는 nlog(n)이 된다.

합병정렬 과정
1) 정렬 되지 않은 리스트를 절반으로 잘라 비슷한 크기의 두 부분리스트로 나눈다.
이때, 리스트의 길이가 0 또는 1이면 이미 정렬된 것으로 본다.
2) 각 부분리스트를 재귀적으로 합병 정렬을 이용해 정렬한다.
3) 두 부분리스트를 다시 하나의 정렬된 리스트로 합병한다.
```

``` c++
[21 10 12 20 25 13 15 22]를 병합정렬로 정렬하자.


			 21 10 12 12 20 25 13 15 22
		         /			    \		
	[21 10 12 20]				 [25 13 15 22]		- divide
	    /  \						  /  \ 	
  [21 10]   [12 20] 			 [25 13] [15 22]	- divide
     /\		   /\				   /\		/\	
 [21] [10]  [12] [20]		   [25] [13] [15] [22]  - divide
 	 \/         \/				   \/		\/
   [10 21]    [12 20]			[13  25]  [15 22]   - combine
          \  /						   \  /
       [10 12 20 21]				[13 15 22 25]   - combine
                   \				/
			   [10 12 13 15 20 21 22 25]			- combine 
			   
			  
```

# 6. 힙 정렬

````
우선, 힙 자료구조를 알아보자면 힙은 완전 이진트리의 일종으로 우선순위큐를 위하여 만들어진 자료구조이다.
=> 최대, 최소값을 쉽게 추출할 수 있는 자료구조

힙 정렬은
최대 힙 트리나 최소 힙 트리를 구성해 정렬하는 방법이라 할 수 있다.
(내림차순 - 최대 힙 , 오름차순 - 최소 힙)

힙 정렬 과정
1) 정렬해야할 n개의 요소들로 최대 힙(완전 이진 트리)를 만든다.
2) 그 다음으로 한 번에 하나 씩 요소를 힙에서 꺼내 배열의 뒤부터 저장하면 된다.
3) 삭제되는 요소들은 값이 감소되는 순서로 정렬되게 된다.*최대값부터 삭제


최대 힙 구현
1) 최대 힙 삽입
1 - 힙에 새로운 요소가 들어오면 힙의 가장 마지막노드에 넣는다.
2 - 부모노드와 비교하며 부모노드>삽입노드가 될 때까지 부모노드와 바꿔준다.
 
 			8
 		 /     \	
 		5      6
 	  /	 \
     2	  3
     
     의 힙이 있다고 가정하자.
     
     이때, 7이라는 새로운 요소가 삽입되면
     
     		8
 		 /     \	
 		5      6
 	  /	 \	  /
     2	  3   7
     
     위와 같이 가장 마지막노드에 삽입을 시킨다.
     
     이제 부모느드와 비교하며 자리를 바꿔준다.
     부모노드 6<삽입노드 7이므로 자리를 바꿔주고, 바뀐 후 부모노드 8 > 삽입노드 7이므로
     여기서 비교 정렬을 멈춘다.
     
   		    8
 		 /     \	
 		5      7
 	  /	 \    /
     2	  3  6
     
     
2) 최대 힙 삭제     
1 - 최대 힙에서 최대값은 루트 노드이므로 루트 노드가 삭제된다.
	* 최대 힙에서 삭제 연산은 최대값을 가진 요소를 삭제하는 것이다.
2 - 삭제된 루트 노드에 힙의 마지막 노드를 가져온다.
3 - 힙을 재구성한다.


   			8
 		 /     \	
 		5      7
 	  /	 \    /
     2	  3  4
     
     최대 값인 루트노드 삭제 후 가장 마지막 노드를 루트 노드에 삽입
     
        	4
 		 /     \	
 		5      7
 	  /	 \    
     2	  3  
     
     힙을 재구성하자. 4 부모느드 < 5 자식노드 이므로 바꿔주고, 부모노드 4> 자식노드2,자식노드3이므로
	4, 5만 바꾸어주자.
	
	        5
 		 /     \	
 		4      7
 	  /	 \    
     2	  3  
     
     
힙 정렬 장점
1) 시간복잡도가 좋다
2) 힙 정렬이 가장 유용한 경우는 전체 자료를 정렬하는 것이 아닌 "가장 큰 값 몇개만 필요할 때"이다.

시간복잡도
nlog(n)

1) 힙 트리의 전체 높이가 거의 log(n)(완전 이진 트리)이므로 하나의 요소를 힙에 삽입하거나 삭제할 때 
재정비하는 시간이 log(n)만큼 소요된다.
   
2) 요소의 개수가 n이므로 전체 nlog(n)의 시간복잡도를 갖는다.
````

# 7. 퀵 정렬

```
퀵 정렬은 불안정 정렬에 속하며 다른 원소와 비교만으로 정렬을 수행하는 비교 정렬에 속한다.
분할 정복 알고리즘의 하나로 평균적으로 매우 빠른 수행속도를 자랑하는 정렬 방법

합병 정렬과 마찬가지로 문제를 두 개로 분류하고 각 문제를 해결해 원래의 문제를 해결하는 분할정복방식이다.

퀵 정렬 과정
1) 리스트 안에 있는 한 요소를 선택한다. 이렇게 고른 요소를 피벗 이라고 한다.
2) 피벗을 기준으로 피벗보다 작은요소들은 왼쪽으로 옮기고, 피벗보다 큰 요소들은 오른쪽으로 옮긴다.
3) 피벗을 제외하고 왼쪽 리스트,오른쪽 리스트를 다
시 정렬한다.
	순환호출을 이용해 부분 리스트를 기준으로 1) ~3) 과정을 진행한다.
4) 리스트가 더 이상 분할이 불가할 때까지 반복한다.


시간복잡도

best - nlog(n)
worst - n^2

[1 2 3 4 5 6 7 8 9 10]

퀵 정렬은 배열이 정렬 되어있을 경우 시간복잡도가 O(n^2)이 된다.
하지만, 삽입 정렬의 경우 위 케이스를 빠르게 정렬할 수 있다.

```



````javascript
[3 2 5 8 1 4 7 10 9 6]
	
배열을 퀵정렬로 정려해보자

배열의 첫원소 3을 피벗값으로 잡고 좌측에서는 우측으로 이동하며 피벗값보다 큰 값,
우측에서는 좌측으로 이동하며 피벗값보다 작은 값을 찾는다.

첫 번째로 left=5, right=1이 된다.
이때 이 두 값의 위치를 바꿔준다
[3 2 1 8 5 4 7 10 9 6]
 -
또 이를 반복하면

left=8 right=1이 되는데 이때 위치가 엇갈(큰 값 인덱스>작은값 인덱스)리면
피벗 값과 작은 값의 위치를 바꿔준다.

[1 2 3 8 5 4 7 10 9 6]
     -
이때 피벗 값 3의 좌측은 3보다 작은값, 우측은 3보다 큰 값으로 정렬된다.

교차된 이후에는 3을 기준으로 좌측에서 피벗값을 선택하고, 우측에서 피벗값을 선택해 다시 퀵정렬을 반복한다.


[1 2 3 8 5 4 7 10 9 6]
 -   * -
 
 3은 정렬을 완료했고, 좌측 배열의 피벗값은 1 우측배열의 피벗 값은 8이된다.
 
[1 2 3 8 5 4 7 10 9 6]
 *   * -
 
 [1 2 3 8 5 4 7 10 6 9]
  * * * -
  
  위 과정에 따라 1,2,3은 정렬을 완료했고, 피벗 8로부터 다시 퀵 정렬을 시작한다.
  
 [1 2 3 8 5 4 7 6 10 9]
  * * * -
  
  10 , 6 -> swap
  
 [1 2 3 8 5 4 7 6 9 10]
  * * * -			
  
  left=9 right=6 으로
  엇갈렸으므로 피벗 값과 작은 값 right6을 바꿔준다.
  
 [1 2 3 6 5 4 7 8 9 10]
  *	* *	-		* -
  
  다시 피벗을 설정하고 반복한다.
  
 [1 2 3 4 5 6 7 8 9 10]
 
 정렬이 완료된다.
````

