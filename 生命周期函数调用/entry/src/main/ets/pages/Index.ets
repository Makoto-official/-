@Extend(Button)
function shapeManual(){
  .width('90%')
  .height(80)
  .backgroundColor(Color.White)
  .fontSize(18)
  .fontColor('#333333')
  .margin({bottom: 10})
}
@Entry
@Component
struct Index {
  //右上角菜单，超过4个会折叠
  menuList:NavigationMenuItem[] = [
    {value:'首页',icon:$r('app.media.home'),action:()=>{}},
    {value:'设置',icon:$r('app.media.set'),action:()=>{}},
    {value:'搜索',icon:$r('app.media.search'),action:()=>{}},
    {value:'编辑',icon:$r('app.media.edit'),action:()=>{}},
  ];
  //工具栏
  toolList: ToolbarItem[] = [
    {value:'首页',icon:$r('app.media.home'),action:()=>{}},
    {value:'分类',icon:$r('app.media.category'),action:()=>{}},
    {value:'收藏',icon:$r('app.media.star'),action:()=>{}}
  ]
  //导航栈
  pathStack: NavPathStack = new NavPathStack();
  build() {
    //导航栏
    Navigation(this.pathStack){
      //搜索
      Row() {
        TextInput({ placeholder: '搜索' })
          .width('90%')
          .margin({ bottom: 10 });
        Image($r('app.media.microphone'))
          .height(24)
          .fillColor('#c1c1c1')
          .margin({ bottom: 8, left: -30 })
      }
      //所有导航内页
      Button('网络设置')
        .shapeManual()
        .onClick(()=>{
          let pathIns : NavPathInfo = {name: 'NetworkSetPage'};
          this.pathStack.pushPath(pathIns,null);
        });
      Button('桌面设置')
        .shapeManual()
        .onClick(()=>{
          let pathIns : NavPathInfo = {name: 'NetworkSetPage'};
          this.pathStack.pushPath(pathIns,null);
        })
      Button('应用设置')
        .shapeManual()
        .onClick(()=>{
          let pathIns : NavPathInfo = {name: 'NetworkSetPage'};
          this.pathStack.pushPath(pathIns,null);
        })


    }.menus(this.menuList)
    .title('设置中心')
    .titleMode(NavigationTitleMode.Full)
    .toolbarConfiguration(this.toolList)
    .backgroundColor('#efefef')
  }
}