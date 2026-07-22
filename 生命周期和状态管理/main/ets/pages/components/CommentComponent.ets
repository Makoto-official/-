import { ReplyItemModel } from "../models/ReplayItem"

@Component
export  struct CommentComponent {
  @ObjectLink InsModel: ReplyItemModel;
  build() {
    Row() {
      //头像列
      Column() {
        Image(this.InsModel.avatar)
          .width(50)
          .borderRadius(8)
      }.justifyContent(FlexAlign.Start)

      //内容列
      Column() {
        //博主名称
        Row() {
          Text(this.InsModel.author)
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ bottom: 10 })
        }.width('100%')

        //评论内容
        Row() {
          Text(this.InsModel.content)
            .fontSize(14)
            .fontColor('#333')
            .lineHeight(20)
        }
        .width('100%')
        .padding({ right: 50 })

        //IP归属和点赞数量
        Row() {
          //Ip归属
          Column() {
            Text(`${this.InsModel.time}  IP归属：${this.InsModel.area}`)
              .fontSize(12)
              .fontColor('#999')
          }

          //点赞数量
          Column() {
            Row() {
              Image($r('app.media.heart_fill'))
                .width(14)
                .fillColor( this.InsModel.likeFlag ? '#fff53f3f': '#999999')
              Text(`${this.InsModel.likeNum}`)
                .fontSize(12)
                .fontColor('#999')
            }
          }
          .onClick(() => {
            console.log('ererere');
            if (this.InsModel.likeFlag) {
              this.InsModel.likeNum--;
              this.InsModel.likeFlag = false;
            } else {
              this.InsModel.likeNum++;
              this.InsModel.likeFlag = true;
            }
          })
        }.justifyContent(FlexAlign.SpaceBetween)
        .width('100%')
        .padding({ right: 50 })
        .margin({ top: 10 })
      }
      .margin({ left: 10 })
    }
    .width('100%')
    .padding(15)
    .alignItems(VerticalAlign.Top)
  }
}