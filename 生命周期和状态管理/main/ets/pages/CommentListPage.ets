import { CommentComponent } from './components/CommentComponent';
import { HmNavBar } from './components/HmNavBar';
import { ReplyItemModel } from './models/ReplayItem';

@Entry
@Component
struct CommentListPage {
  @State scrollHeightValue: number = 100;
  @State commentValue : string = '';
  @State currentComment: ReplyItemModel = new ReplyItemModel({
    id: 999,
    author: '小明',
    avatar: $r('app.media.h0'),
    likeNum: 10,
    likeFlag: false,
    time: '03-02',
    area: '北京',
    content: '自从我升级了鸿蒙系统，真的感觉手机的流畅度提升了不少。每次滑动屏幕和点击应用，都能感受到那种丝滑般的顺畅，真是太棒了!'
  })
  @State commentList: ReplyItemModel[] = [
    //评论列表数据
    new ReplyItemModel ({
      id: 1,
      avatar: $r('app.media.h1'),
      author: '小智',
      content: '鸿蒙系统的安全性也很高，让我在使用过程中感到非常安心。',
      time: '11-30',
      area: '海南',
      likeNum: 34,
      likeFlag: false,
    }),
    new ReplyItemModel({
      id:2,
      avatar: $r('app.media.h2'),
      author:'小红',
      content:'鸿蒙系统的多设备协同功能真的很强大，我可以同时连接多台设备。',
      time:'11-29',
      area:'北京',
      likeNum:58,
      likeFlag: false}),
    new ReplyItemModel({
      id:3,
      avatar: $r('app.media.h3'),
      author:'小丽',
      content:'我觉得鸿蒙系统在续航方面也很不错，电池的使用时间明显延长了。',
      time:'11-281',
      area:'上海',
      likeNum:10,
      likeFlag: false
    }),
    new ReplyItemModel({
      id: 4,
      avatar: $r('app.media.h0'),
      author: '小刚',
      content: '这种既注重安全又兼顾性能的设计理念，让我对鸿蒙系统充满了信心。',
      time: '11-27',
      area: '河南',
      likeNum: 139,
      likeFlag: false
    }),
    new ReplyItemModel({
      id: 5,
      avatar: $r('app.media.h1'),
      author: '小霞',
      content: '鸿蒙系统是一款具有创新理念和广阔前景的操作系统，我期待着它在未来能够取得更大的突破和发展。',
      time: '11-27',
      area: '山西',
      likeNum: 29,
      likeFlag: false
    }),
    new ReplyItemModel ({
      id: 6,
      avatar: $r('app.media.h2'),
      author: '小雨',
      content: '鸿蒙这种跨设备的协同体验让我感受到了前所未有的便捷和高效。',
      time: '11-26',
      area: '广东',
      likeNum: 100,
      likeFlag: false
    })
  ];

  @Builder
  createComment(InsModel: ReplyItemModel){
    //行
    Row(){
      //头像列
      Column(){
        Image(InsModel.avatar)
          .width(50)
          .borderRadius(8)
      }.justifyContent(FlexAlign.Start)
      //内容列
      Column(){
        //博主名称
        Row(){
          Text(InsModel.author)
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({bottom: 10})
        }.width('100%')
        //评论内容
        Row(){
          Text(InsModel.content)
            .fontSize(14)
            .fontColor('#333')
            .lineHeight(20)
        }
        .width('100%')
        .padding({right: 50})
        //IP归属和点赞数量
        Row(){
          //Ip归属
          Column(){
            Text(`${InsModel.time}  IP归属：${InsModel.area}`)
              .fontSize(12)
              .fontColor('#999')
          }
          //点赞数量
          Column(){
            Row(){
              Image($r('app.media.heart_fill'))
                .width(14)
              Text(`${InsModel.likeNum}`)
                .fontSize(12)
                .fontColor('#999')
            }
          }
          .onClick(()=>{
            console.log('ererere');
            if(InsModel.likeFlag){
              InsModel.likeNum --;
              InsModel.likeFlag = false;
            } else {
              InsModel.likeNum ++;
              InsModel.likeFlag = true;
            }
          })
        }.justifyContent(FlexAlign.SpaceBetween)
        .width('100%')
        .padding({right: 50})
        .margin({top: 10})
      }
      .margin({left: 10})
    }
    .width('100%')
    .padding(15)
    .alignItems(VerticalAlign.Top)
  }
  build() {
    Column() {
      HmNavBar();
      Divider();
      CommentComponent({InsModel:this.currentComment})
      Divider()
        .strokeWidth(8)
      //评论数量
      Row(){
        Text('评论数（50）')
          .lineHeight(30)
          .fontSize(14)
      }.width('100%')
      .padding({left: 15})
      Divider();
      //评论列表
      Scroll(){
        List(){
          ForEach(this.commentList, (item: ReplyItemModel, index: number)=>{
            ListItem(){
              // this.createComment(item)
              CommentComponent({InsModel:item})
            }
          })
        }
        .margin({bottom: 100})
      }
      .height(this.scrollHeightValue)
      //写评论区
      Row(){
        Column(){
          TextInput({placeholder: '请输入评论'})
            .width(260)
            .onChange((value)=>{
              this.commentValue = value;
            });
        }
        Column(){
          Button('发布')
            .onClick(()=>{
              let tempContent : ReplyItemModel = new ReplyItemModel({
                id: this.commentList.length + 1,
                avatar: $r('app.media.houyi'),
                author: '小花❀',
                content: this.commentValue,
                time: new Date().toDateString(),
                likeNum: 0,
                likeFlag: false,
                area: '武汉'
              })

              this.commentList.unshift(tempContent)
            })
          }
        }.margin({top: -40})
      .backgroundColor(Color.White)
      .width('100%')
      .padding(15)
      .justifyContent(FlexAlign.SpaceBetween)
    }
    .height('100%')
    .width('100%')
    .onAreaChange((oldArea: Area, newArea: Area)=>{
      this.scrollHeightValue = (newArea.height as number) -  250
    })
  }
}