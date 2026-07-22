@Entry
@Component
export struct LinkPropChild{
  @Link num: number;
  build() {
    Column(){
      Row(){
        Text('子组件: ' + this.num);
        Button('+1')
          .onClick(()=>{
          this.num ++;
        })
      }
    }
  }
}
