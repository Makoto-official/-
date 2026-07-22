import { LinkPropChild } from './LinkPropChild';

@Entry
@Component
struct LinkPropPage {
  @State countNum: number = 0;

  build() {
  Column({space: 20}){
    Row(){
      Text('父组件: ' + this.countNum);
      Button('+1')
        .onClick(()=>{
        this.countNum ++;
        })
    }
    Row(){
      LinkPropChild({num: this.countNum});
    }
  }
  }
}