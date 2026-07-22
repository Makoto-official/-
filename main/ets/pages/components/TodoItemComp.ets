import { TodoItem } from "../models/TodoItem"
import { emitter } from "@kit.BasicServicesKit";

@Component
export struct TodoItemComp{
  @Prop insTodoItem: TodoItem;
  @Prop len: number;
  @Link todoList: TodoItem[];
  build() {
    ListItem(){
      Row(){
        //复选框
        Column(){
          Checkbox()
            .select(this.insTodoItem.status)//是否选中
            .onChange((value: boolean)=>{//value储存是否选中
              this.insTodoItem.status = value;
              if(value){
                this.len ++;
              }else {
                this.len --;
              }
            })
        }
        //事项
        Column(){
          Text(this.insTodoItem.text)
            .decoration({type: this.insTodoItem.status? TextDecorationType.LineThrough : TextDecorationType.None})
        }.width(260)
        .alignItems(HorizontalAlign.Start)
        //删除按钮
        Column(){
          Image($r('app.media.Delete'))
            .width(26)
            .fillColor('#999999')
            .onClick(()=>{
              //删除数组中的元素
              //this.todoList.splice( this.insTodoItem.id - 1, 1);
              emitter.emit('deleteTodoItem', {data: { itemId: this.insTodoItem.id }});
            })
        }
        Divider()
      }.justifyContent(FlexAlign.SpaceBetween)
      .width('100%')
      .margin({top: 10, bottom: 10})
    }
  }
}