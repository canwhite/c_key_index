#include<stdio.h>
#include "utils/utils.h"
#include<stdlib.h>
#include<string.h>



//--FUNCTION--
//TODO, 测试另外一种情况
void test(int* a){
   printf("I am test,params - %d\n",*a); 
}

//先实现一个函数
void A(int a){
    printf("I am function A,params - %d\n",a);
}


// 定义一个Object
typedef struct 
{
    int id;
    // char name[50]; //这样定义相当于提前预留50
    // 这里用char* 表示字符串
    char* name; 
} Object;

Object createObject(int id, char* name){
    //先声明再初始化的过程
    Object obj;
    obj.id = id;
    //如果字符串用的不是char strName[num]定义，而是用指针定义的，要先分配内存
    obj.name = malloc(50*sizeof(char));
    //strcpy没有第三个参数sizeof，不是内存安全的
    //strncpy有第三个参数size，是内存安全的
    //--这里的n代表的是number，是字符串的个数的意思
    // strcpy(objects_1[i].name, "SomeString"+i);
    strncpy(obj.name,name, 50);
    return obj;
}

//注意参数的声明
// void：指示函数没有返回值。
// (*ptr)：意味着 ptr 是一个指针，指向一个函数。
// ()：表示这个被指向的函数接收的参数列表为空，即该函数不需要任何输入参数
void B(void (*ptr)(int)){
    (*ptr)(5);
}

int main(void){

    // --- normal function 
    int b = 10;
    //声明一个指针
    //一般都是int* 声明，*a出现在解引用的时候
    int* a = NULL;
    //给指针引用
    a = &b;
    //将引用给到函数
    test(a);

    // --- callback
    void (*ptr)(int) = &A;
    //传入的还是引用，然后内部实现的解引用
    B(ptr);

    
    // --- malloc、calloc、realloc

    //Pre: c语言常规设置数组的方法
    // type arrayName[arraySize];

    //malloc
    //只有一个参数是size
    //common部分
    int n = 5;
    Object (*createObj)(int,char*) = &createObject;


    //对于指针数组，当然字符串是char数组一样适用
    //1）先分配空间
    Object* objects_1 = (Object*)malloc(n * sizeof(Object));
    for (int i = 0; i < n; i++)
    {
        char* temp_name = malloc(50*sizeof(char));
        strcpy(temp_name, "object_1_name");  // 你需要为这段内存提供一个初始字符串。
        //2）再初始化
        objects_1[i] = (*createObj)(i,temp_name);
        printf("%s \n",objects_1[i].name);


    }

    //calloc
    /** calloc和malloc的最大区别
    malloc只分配区间，
    calloc在分配区间的同时，所有位都初始化为0

    参数的主要区别在于
    将n*sizeof分成了两块儿
    */
   
    Object* objects_2 = (Object*)calloc(n,sizeof(Object));
    for (int i = 0; i < n; i++)
    {
        //todo
        char* temp_name = malloc(50*sizeof(char));
        strcpy(temp_name, "object_2_name");  // 你需要为这段内存提供一个初始字符串。
        //2）再初始化
        objects_2[i] = (*createObj)(i,temp_name);
        printf("%s \n",objects_2[i].name);

    }
    
    //realloc
    //使用realloc可以在原有的基础上扩大空间,用于实现动态数组
    objects_1 = (Object*)realloc(objects_1, 10*sizeof(Object));
    for (int i = 5;  i < 10; i++)
    {
        char* temp_name = malloc(50*sizeof(char));
        strcpy(temp_name, "object_1_name");  // 你需要为这段内存提供一个初始字符串。
        //2）再初始化
        objects_1[i] = (*createObj)(i,temp_name);
        printf("%s \n",objects_1[i].name);

    }

    //释放堆内存
    //只要是分配了内存的，最后记得要清理
    for (int i = 0; i < 10; i++)
    {
        free(objects_1[i].name);
    }
    for (int i = 0; i < n; i++)
    {
        free(objects_2[i].name);
        
    }
    free(objects_1);
    free(objects_2);


    // --- string 
    /** 使用字符串更好的方法是使用char数组
    这样相当于提前分配了空间
    type name[size]
    */

    //字符串复制上边已经讲了两种了，这里我们接着往下写
    // char* s1 = "Hello";
    // char* s2 = "World";
    // char* s3 = strcat(s1,s2);
    // printf("s3:%s",s3);







    return 0 ; 
}
