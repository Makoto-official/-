// 每一条评论数据模型
export interface ReplayItem{
  avatar : ResourceStr;
  author: string;
  content: string;
  id: number;
  time: string;
  likeNum: number;
  likeFlag: boolean;
  area: string;
}
@Observed
export class ReplyItemModel implements ReplayItem{
  avatar: ResourceStr;
  author: string;
  content: string;
  id: number;
  time: string;
  likeNum: number;
  likeFlag: boolean;
  area: string;
  //构造函数
  constructor(InsRelayItem : ReplayItem) {
    this.avatar = InsRelayItem.avatar;
    this.author = InsRelayItem.author;
    this.content = InsRelayItem.content;
    this.id = InsRelayItem.id;
    this.time = InsRelayItem.time;
    this.likeFlag = InsRelayItem.likeFlag;
    this.likeNum = InsRelayItem.likeNum;
    this.area = InsRelayItem.area;
  }
}