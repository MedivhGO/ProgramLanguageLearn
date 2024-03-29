# 再探迭代器
除了为每个容器定义的迭代器之外，标准库在头文件iterator中还定义了额外几中迭代器。这些迭代器包括以下几种。

1. 插入迭代器，这些迭代器被绑定到一个容器上，可以用来向容器插入元素。
2. 流迭代器：这些迭代器绑定带输入输出流上，可以用来遍历所有关联IO流。
3. 反向迭代器：这些迭代器向后而不是向前移动，除了forward_list之外的标准库容器都有反向迭代器。
4. 移动迭代器：这些专用的迭代器不是拷贝其中的元素，二是移动它们。
##插入迭代器
1. back_inserter(c)
2. front_insert(c)
3. inserter(c,iter)

```c++
    *iter = val;
    //等价于
    it = c.insert(it,val);
    ++it;
```

## iostream迭代器

1. istream_iterator 读取输入流。
2. ostream_iterator 向一个输出流写数据。

从标准输入读取数据的例子

```c++
    vector<int> vec;
    istream_iterator<int> in_iter(cin);
    istream_iterator<int> in_eof;
    
    while (in_iter != eof)
    {
        vec.push_back(*in_iter++);
    }
    //重写为如下形式
    istream_iterator<int> in_iter(cin),eof;
    vector<int> vec(in_iter,eof); //使用以迭代器为参数的vector的构造函数。
```
### 使用算法操作流迭代器

```c++
    istream_iterator<int> in(cin),eof;
    cout << accumulate(in,eof,0) << endl;
```
## ostream_iterator
当我们创建一个ostream_iterator时，我们可以提供第二个参数，它是一个字符串，在输出每个元素后都会打印此字符串。此字符串必须是一个C风格的字符串（即，一个字符串字面常量，或者一个指向以空字符结尾的字符数组的指针）。
**必须将ostream_iterator**绑定到一个指定的流，不允许空的或表示尾后位置的ostream_iterator。
我们使用标准输出来输出序列值

```c++
    ostream_iterator<int> out_iter(cout," ");
    vector<int> ivec{1,2,3,4};
    for (auto e : ivec)
    {
        *out_iter++ = e;
    }
    cout << endl;
    // 使用copy算法，快速打印到标准输出
    copy(ivec.begin(),ivec.end(),out_iter); //调用一个三个参数的copy算法，前两个迭代器是源迭代器，第三个迭代器是目的迭代器。
```
## 使用流迭代器处理类类型
我们可以为任何定义了输入符号(>>)的类型创建istream_iterator对象，类似的oistream_iterator。

