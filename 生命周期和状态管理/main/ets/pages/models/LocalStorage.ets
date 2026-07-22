import User from '../storages/User';
import { router } from '@kit.ArkUI';

@Entry(User)
@Component
struct LocalStoragePage {

  @LocalStorageProp('name') name: string = '';
  @LocalStorageLink('age') age: number = 0;
  @LocalStorageProp('age') ageProp: number = 0;
  build() {
    Column({space: 20}) {
      Row({space: 20}) {
        Text('姓名' +this.name);
      }

      Row({space: 20}){
        Text('年龄Link : ' + this.age);
        Button('+1').onClick(()=>{
          console.log('22222')
          this.ageProp ++;
        })
      }

      Row({space: 20}){
        Text('年龄Prop : ' + this.ageProp);
        Button('+1').onClick(()=>{
          this.ageProp ++;
        })
      }

     Row(){
        Button('跳转到其他页面')
          .onClick(()=>{
            router.pushUrl({url: 'pages/TestLocalStorage'})
          })
      }
    }
  }
}