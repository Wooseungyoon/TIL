# 선택정렬

- 현재 위치에 들어갈 값을 찾아 정렬하는 배열

- 정렬 되지 않는 인덱스의 맨 앞에서 부터, 이를 포함한 이후 배열값 중 가장 작은 값을 찾는다
- 가장 작은 값을 찾으면, 그 값을 현재 인덱스의 값과 바꿔준다

- n-1개,n-2개,...,2,1개 씩 비교 반복
- 시간복잡도 : O(n^2)



```c++
void SelectionSort(vector<int> v){

	for(int i=0;i<v.size();i++){
		int tmp=i;
		for(int j=i+1;j<v.size();j++){
		
			if(v[i]>v[j]) tmp=j;
		
		}
		swap(v[i],v[tmp]);
	}
}
```





# 삽입정렬

- 현재 위치에서 하위 값들을 비교하여 현재 자신이 들어갈 자리를 찾아가는 방식
- 삽입 정렬은 두 번째 인덱스부터 시작. 현재 인덱스는 별도의 변수에 저장해주고, 비교 인덱스를 현재 인덱스 -1로 잡는다.
- 삽입을 위한 변수와 비교인데그스의 배열 값을 비교한다.
- 삽입 변수의 값이 더 작으면 현재 인덱스로 비교 인덱스의 값을 저장해주고, 비교 인덱스를 -1하여 비교를 반복한다.
- 만약 삽입 변수의 값이 더 크면 비교 인덱스의 값을 +1 증가시킨다.

- 시간복잡도 : 역정렬인경우 (최악의 상황)  시간복잡도는 O(n^2) / 이미 정렬 되어 있는 경우 O(n) 
- 시간복잡도는 최악의 상황을 고려하여 선정한다

```c++
void InsertionSort(vector<int> v){

	for(int i=1;i<v.size();i++){
		int key=v[i];
		int j=i-1;
		
		while(j>=0 && key<v[j]){		
			v[j+1]=v[j];
			j++;
		}
		v[j+1]=key;
	
	}
}
```



# 퀵 정렬

- 특정한 값(pivot)을 기준으로 큰 숫자와 작은숫자를 구분한다.
- 
