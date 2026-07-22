import { router } from '@kit.ArkUI';

@Entry
@Component
struct AppStoragePage {
  @StorageProp('name') name: string= '';
  @StorageLink('age') age: number = 0;
  @StorageProp('age') ageProp: number = 0;

  build() {
    Column() {
      Column({space: 20}) {
        Row({space: 20}) {
          Text('姓名' +this.name);
        }

        Row({space: 20}){
          Text('年龄Link : ' + this.age);
          Button('+1').onClick(()=>{
            console.log('22222')
            // this.ageProp ++;
            AppStorage.set('age', this.age ++)
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
    .height('100%')
    .width('100%')
  }
}