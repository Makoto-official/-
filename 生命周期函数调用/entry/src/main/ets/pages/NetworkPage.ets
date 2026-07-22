import { promptAction } from "@kit.ArkUI";

@Extend(Button)
function exB1(){
  .width('90%')
  .backgroundColor(Color.White)
  .fontColor('#333333')
  .fontSize(16)
  .margin({bottom: 10})
  .type(ButtonType.Normal)//圆角矩形
  .borderRadius(8)//调整圆角的大小
  .align(Alignment.Start)
}
@Entry
@Component
struct NetworkPage { //这个是Navgation的内页
  pathStack : NavPathStack = new NavPathStack();
  //拦截函数
  registerInterceptors(){
    this.pathStack.setInterception({
      willShow:(from, to, operation, isAnimated)=>{
        //跳转前执行的操作
        promptAction.showDialog({
          message: '确定退出吗？',
          buttons: [
            {text: '确认',color: '#333'},
            {text: '取消', color: '#f00'}
          ]
        })
      },
      didShow: (from, to, operation, isAnimated)=>{}
    })
  }
  build() {
    NavDestination() {
      Button('无线局域网')
        .exB1();
      Button('蓝牙')
        .exB1();
      Button('蜂窝网络')
        .exB1();
      Button('个人热点')
        .exB1();
    }
    .backgroundColor('#efefef')
    .onReady((context)=>{
      this.pathStack = context.pathStack;
    })
    .onAppear(()=>{
      this.registerInterceptors();
    })
  }
}

@Builder
export function NavSubBuilder(){
  NetworkPage();
}