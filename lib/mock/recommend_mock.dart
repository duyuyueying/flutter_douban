class RecommendMock{
  static const response = {
    "code": 0,
    "message": "成功",
    "data": [
      {
        "author": {
          "avatar": 'https://via.placeholder.com/150',
          "name": '我，喜欢你小组',
          "id": 1,
          "type": 'group', // group：小组；person: 个人
        },
        "topic": {
          "id": 1,
          "name": '生活中让你感受到“万物可爱”的瞬间'
        },
        "images": [
          // 3张图片样式
          'https://via.placeholder.com/500',
          'https://via.placeholder.com/300',
          'https://via.placeholder.com/900',
          'https://via.placeholder.com/900',
          'https://via.placeholder.com/900',
        ],
        "content": '内容日荣，内容日荣，内容日荣，内容日荣，内容日荣，内容日荣，内容日荣，内容日荣',
        "title": '我是标题',
        "likeNum": '649',
        "commentNum": '19',
        "transmitNum": '43',
        "isLiked": true,
        "type": 'daily' // article: 文章；daily: 日记
      },
      {
        "author": {
          "avatar": 'https://via.placeholder.com/150',
          "name": '我，喜欢你小组',
          "id": 1,
          "type": 'group', // group：小组；person: 个人
        },
        "topic": {
          "id": 1,
          "name": '生活中让你感受到“万物可爱”的瞬间'
        },
        "images": [
          // 3张图片样式
          'https://via.placeholder.com/500',
          'https://via.placeholder.com/300',
          'https://via.placeholder.com/900',
          'https://via.placeholder.com/900',
        ],
        "content": '内容日荣，内容日荣，内容日荣，内容日荣，内容日荣，内容日荣，内容日荣，内容日荣',
        "title": '我是标题',
        "likeNum": '649',
        "commentNum": '19',
        "transmitNum": '43',
        "isLiked": true,
        "type": 'daily' // article: 文章；daily: 日记
      },
      {
        "author": {
          "avatar": 'https://via.placeholder.com/150',
          "name": '只有一张图片',
          "id": 1,
          "type": 'group', // group：小组；person: 个人
        },
        "topic": {
          "id": 1,
          "name": '生活中让你感受到“万物可爱”的瞬间'
        },
        "images": [
          // 3张图片样式
          'https://via.placeholder.com/500',
        ],
        "content": '内容日荣，内容日荣，内容日荣，内容日荣，内容日荣，内容日荣，内容日荣，内容日荣',
        "title": '我是标题',
        "likeNum": '649',
        "commentNum": '19',
        "transmitNum": '43',
        "isLiked": true,
        "type": 'daily' // article: 文章；daily: 日记
      },
    ]
  };
}