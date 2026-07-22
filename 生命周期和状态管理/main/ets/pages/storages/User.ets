interface User {
  name: string;
  age: number;
}
//定义了一个本地存储，entry所有的对象都可以访问
export default new LocalStorage({name: '小明', age: 18} as User)