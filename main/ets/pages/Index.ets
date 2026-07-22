import { KeyCode } from '@kit.InputKit';
import { it } from '@ohos/hypium';
import { TodoItemComp } from './components/TodoItemComp';
import { TodoItem } from './models/TodoItem';
import { emitter } from '@kit.BasicServicesKit';
interface delItem {
  itemId:number;
}


@Entry
@Component
struct Index {
  @State message: string = '';//当前用户的输入
  @State todoList: TodoItem[] = [];//存放待做事项
  @State todoListLength: number = 0;

  build() {
    Column() {
      Row(){
        //1.输入框
        TextInput({placeholder: '请输入待完成的事项',text:this.message})
        //输入事件
          .onChange((value)=>{//输入事件
            this.message = value;//这是组件内部状态的管理
          })
          .onKeyEvent((Event)=>{//键盘的点击事件
            //判断用户输入回车且输入了待完成事项，此时需要存储到todoList中
            if (Event.keyCode == KeyCode.KEYCODE_ENTER && this.message.trim() != '') {
              let ins: TodoItem = {
                id: this.todoList.length + 1,
                text: this.message,
                status: false
              }

              this.todoList.push(ins);
              this.message = '';//存储事件之后，清空用户输入
            }
          })
      }
      //2.待完成事项
      Row(){
        Text(`已完成${this.todoListLength}/${this.todoList.length}`)
      }.width('100%')
      .margin(20)

      List(){
        ForEach(this.todoList,(item:TodoItem,index:number)=>{
          TodoItemComp({insTodoItem: item, len: this.todoListLength,todoList: this.todoList});
        })
      }

    }
    .height('100%')
    .width('100%')
    .padding(20)
  }
    //监听删除事件
    deleteItem: Callback<emitter.EventData> = (eventData: emitter.EventData) => {
      console.info(`eventData: ${JSON.stringify(eventData)}`);
      let del : delItem = eventData.data as delItem;
      this.todoList.splice(del.itemId - 1, 1);
    }

    //页面挂载之后绑定监听事件
    onDidBuild(): void {
      // 收到deleteTodoItem事件后执行该回调函数
      emitter.on('deleteTodoItem', this.deleteItem);
    }

    }