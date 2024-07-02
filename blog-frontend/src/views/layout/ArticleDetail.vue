<script setup>
import { ref, onMounted } from "vue";
import { useRouter } from "vue-router";
import { ElMessage } from "element-plus";
const route = useRouter();
import axios from "axios";
const textarea = ref("");

// 从这里获取文章id
const router = useRouter();
console.log(route);
const props = defineProps({
  article: "object",
  cls: "object",
});

onMounted(() => {
  getAllComment();
});
console.log(props)
const cls = ref(props.cls.catename);
const content = ref(props.article);

// 存放评论列表
const commentList = ref([]);

const open2 = () => {
  ElMessage({
    message: "评论成功！",
    type: "success",
  });
};

const judgeLogin = () => {
  var value = localStorage.getItem("userId");
  if (value == null ) {
    open1("请先登录！");
    router.replace({ name: "Login" });
    return true;
  } else {
    console.log("已经登录");
    return false;
  }
};

const sendMsg = () => {
  var j = judgeLogin();
  if (j != false) {
    return;
  }
  console.log(content.value);
  axios
    .post("http://127.0.0.1:8080/comments/upComment", {
      id: "",
      user: localStorage.getItem("userId"),
      blog: content.value.id,
      content: textarea.value,
      time: "",
    })
    .then((response) => {
      if (response.data.code == "200") {
        getAllComment();
        open2();
        textarea.value = null;
      } else {
        open1("评论失败");
      }
    })
    .catch((error) => {
      console.log(error);
    });
};

const open1 = (msg) => {
  ElMessage.error(msg);
};

const getAllComment = () => {
  axios
    .get("http://127.0.0.1:8080/comments/getComment?blog=" + content.value.id)
    .then((response) => {
      if (response.data.code == "200") {
        commentList.value = response.data.data;
      } else {
        open1("评论拉取失败");
      }
    })
    .catch((error) => {
      console.log(error);
    });
};
</script>

<template>
  <div class="container">
    <div class="container-body">
      <div class="content">
        <h1 class="title" style="margin: 15px">{{ content.title }}</h1>

        <div class="box" style="display: flex; margin-left: 25px">
          <img
            style="
              cursor: pointer;
              flex: 0.4;
              width: 40px;
              height: 40px;
              border-radius: 80px;
            "
            src="https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fc-ssl.duitang.com%2Fuploads%2Fitem%2F201707%2F30%2F20170730235536_W8ckh.thumb.400_0.jpeg&refer=http%3A%2F%2Fc-ssl.duitang.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1722180796&t=869e654ca5449fbb0ee9952321ebfca9"
          />
          <div class="box2" style="flex: 8">
            <div
              class="top"
              style="
                font-size: 11px;
                display: flex;
                color: #cccccc;
                flex-direction: row;
              "
            >
              <div class="user" style="margin-right: 10px; margin-left: 5px">
                {{ content.user }}
              </div>
              <div>*</div>
              <div class="time" style="margin-left: 10px">
                {{ content.time }}
              </div>
            </div>
            <div class="bottom" style="font-size: 13px; color: #cccccc">
              <div class="cls" style="color: #24adf3">【{{ cls }}】</div>
            </div>
          </div>
        </div>
      </div>
      <hr style="margin: 20px" />
      <div class="context" style="height: 350px">
        <div style="font-size: 14px; text-indent: 2em">
          {{ content.content }}
        </div>
      </div>
    </div>
    <div class="container-body">
      <div class="comment">
        <h4 style="margin: 5px">评论</h4>
        <div class="box" style="display: flex">
          <img
            style="
              cursor: pointer;
              flex: 0.4;
              width: 40px;
              height: 40px;
              border-radius: 40px;
            "
            src="https://www.huashibus.com/article/uploads/211228/H.jpg"
          />
          <el-input
            v-model="textarea"
            style="width: 80%; flex: 10"
            :rows="3"
            maxlength="150"
            show-word-limit
            type="textarea"
            placeholder="请输入评论..."
          />
        </div>
        <el-button
          type="primary"
          @click="sendMsg"
          style="float: right; margin-top: 10px"
          :disabled="textarea == ''"
          >评论</el-button
        >

        <div class="comment-list" style="margin-top: 60px">
          <div
            class="comment-item"
            style="display: flex; justify-content: space-between"
            v-for="item in commentList"
            :key="item.id"
          >

            <div class="comment-container" style="width: 90%; margin: auto">
              <div class="comment">
                <div class="comment-header">
                  <span class="username">{{ item.user }}:</span>
                  <span class="timestamp">{{ item.time }}</span>
                </div>
                <div class="comment-content">{{ item.content }}</div>
              </div>
            </div>
            <div class="date">{{ item.date }}</div>
          </div>
        </div>
        <div
          v-if="commentList.length <= 0"
          style="text-align: center; margin-top: 20px"
        >
          <strong>暂无评论!</strong>
        </div>
      </div>
    </div>
  </div>
</template>

<style scoped lang="scss">
.container {
  background-color: #f3f3f3;
  width: 100%;
  height: 100vh;

  .container-body {
    width: 85%;
    min-height: 20vh;
    margin: 10px auto;
    padding: 10px;
    // overflow-y: hidden;
    background-color: #ffffff;
    border-radius: 8px;

    .content {
    }

    .comment {
    }
  }

  .comment-container {
    margin-bottom: 20px; /* 可选，用于评论之间的间距 */
  }

  .comment {
    border: 1px solid #ddd; /* 可选，用于区分不同的评论 */
    padding: 10px;
    margin-bottom: 10px; /* 可选，用于评论之间的间距 */
    width: 95%;
  }

  .comment-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 5px; /* 可选，用于头部和内容之间的间距 */
  }

  .username {
    font-weight: bold; /* 可选，突出用户名 */
  }

  .timestamp {
    color: #999; /* 可选，使用较浅的颜色表示时间戳 */
  }
  .comment-content {
    /* 这里可以添加更多的样式，如字体大小、颜色等 */
    text-indent: 2em;

  }
}
</style>
