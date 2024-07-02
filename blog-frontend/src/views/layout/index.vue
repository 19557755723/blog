<script setup>
import { ref } from "vue";
import { Search } from "@element-plus/icons-vue";
import { useRouter } from "vue-router";
import { ElMessage, vLoading } from "element-plus";
import axios from "axios";
import { onMounted } from "vue";

const keyword = ref();

const menuList = ref([{ id: 0, catename: "全部" }]);

onMounted(() => {
  judgeLogin();
  getAllCate();
  getAllBlog();
  window.addEventListener("popstate", handlePopstate);
});
const isLogin = ref(false);

const judgeLogin = () => {
  var value = localStorage.getItem("userId");
  if (value != "" && value != undefined) {
    isLogin.value = true;
    console.log("未登录")
  }
};

const handlePopstate = (event) => {
  isDetail.value = false;
};

const getAllBlog = () => {
  axios
    .get("http://127.0.0.1:8080/blog/all")
    .then((response) => {
      if (response.data.code == "200") {
        articleList.value = response.data.data;
        tempList.value = response.data.data;
      } else {
        open1("信息获取失败");
      }
    })
    .catch((error) => {
      console.log(error);
    });
};
const getAllCate = () => {
  axios
    .get("http://127.0.0.1:8080/cate/all")
    .then((response) => {
      if (response.data.code == "200") {
        response.data.data.forEach((item) => {
          menuList.value.push(item);
          tempList.value.push(item);
        });
      } else {
        open1("类别信息获取失败");
      }
    })
    .catch((error) => {
      console.log(error);
    });
};

const searchArticle = () => {
  if (keyword.value.length > 0) {
    articleList.value = articleList.value.filter((item) => {
      if (item.title.indexOf(keyword.value) >= 0) {
        return item;
      }
    });
  } else {
    articleList.value = tempList.value;
  }
};

const open1 = (msg) => {
  ElMessage.error(msg);
};

const dialogVisible = ref(false);
const router = useRouter();

const currentMenu = ref("全部");

const tempList = ref([]);

const articleList = ref([
]);

const getBlogByName = (num) => {
  axios
    .get("http://127.0.0.1:8080/blog/" + num)
    .then((response) => {
      if (response.data.code == "200") {
        articleList.value = response.data.data;
      } else {
        open1("信息获取失败");
      }
    })
    .catch((error) => {
      console.log(error);
    });
};

const isDetail = ref(false);

const selectMenu = (menu) => {
  currentMenu.value = menu.remark;
  if (menu.id == 0) {
    getAllBlog();
    isDetail.value = false;
    router.push({ name: "Layout" });
  } else {
    getBlogByName(menu.id);
    isDetail.value = false;
    router.push({ name: "Layout" });
  }
};

const logOut = () => {
  dialogVisible.value = true;
  localStorage.removeItem("userId");
};
const currentArticle = ref({});

const gotoLogin=()=>{
  router.replace({name:"Login"})
}
const Confirm = () => {
  dialogVisible.value = false;
  router.push({ name: "Login" });
  ElMessage({
    message: "退出登录成功",
    type: "success",
  });
};
var cls = ref();
const ViewDetail = (article) => {
  console.log(article);
  router.push({ name: "ArticleDetail", params: { id: article.id } });
  currentArticle.value = article;
  cls.value = menuList.value[article.remark];

  isDetail.value = true;
};
</script>

<template>
  <div class="container">
    <el-container>
      <el-header height="60px" style="background: #fafafa">
        <div
          class="header"
          style="
            display: flex;
            justify-content: space-between;
            line-height: 60px;
          "
        >
          <div class="header-left" style="display: flex">
            <div class="logo">
              <img src="../../assets/logo.png" style="width: 150px" />
            </div>
            <div
              style="margin: 0 20px; cursor: pointer; font-size: 14px"
              class="menu-item"
              v-for="item in menuList"
              :key="item.id"
              :class="currentMenu == item.catename ? 'active' : ''"
              @click="selectMenu(item)"
            >
              {{ item.catename }}
            </div>
          </div>
          <div class="header-right">
            <el-input
              v-model="keyword"
              style="width: 240px"
              placeholder="搜索文章"
              :suffix-icon="Search"
              @change="searchArticle"
            />
            <el-dropdown style="vertical-align: middle">
                   <button v-if="!isLogin" @click="gotoLogin" class="loginb">登录</button>
              <el-avatar
              v-if="isLogin"
                style="margin-left: 10px; cursor: pointer"
                src="https://preview.qiantucdn.com/58pic/0R/Of/TN/tZ/16lohzjcgvkiwyf0u8mdx439sprqn7ab_PIC2018.png%21w1024_new_0_1"
              />
              <template #dropdown v-if="isLogin">
                <el-dropdown-menu>
                  <el-dropdown-item @click="logOut">退出登录</el-dropdown-item>
                </el-dropdown-menu>
              </template>
            </el-dropdown>
          </div>
        </div>
      </el-header>
      <el-main
        class="main"
        style="
          max-height: calc(100vh - 60px);
          background: #f3f3f3;
          overflow-y: auto;
        "
      >
        <div
          style="background: #f9f9f9; height: 82vh"
          v-if="!isDetail && articleList != null"
        >
          <div class="article">
            <div
              class="article-item"
              style="
                margin: 20px;
                padding: 10px;
                border-bottom: 1px solid #e7e7e7;
                min-height: 80px;
              "
              @click="ViewDetail(item)"
              v-for="(item, index) in articleList"
              :key="index"
            >
              <h3 style="margin-bottom: 15px">{{ item.title }}</h3>
              <div>
                <span style="font-size: 13px; color: #52ACFF">
                  【{{ menuList[item.remark].catename }}】</span
                >
                <span style="font-size: 12px">发布于{{ item.time }}</span>
                <span style="font-size: 12px; margin-left: 8px"
                  >| {{ item.user }}
                </span>
              </div>
            </div>
          </div>
                   
          <el-divider content-position="center" v-if="articleList == ''"
            >无更多内容</el-divider
          >
        </div>
        <router-view :article="currentArticle" :cls="cls" v-else></router-view>
      </el-main>
    </el-container>

    <el-dialog v-model="dialogVisible" title="提示" width="500">
      <span>确定退出吗?</span>
      <template #footer>
        <div class="dialog-footer">
          <el-button @click="dialogVisible = false">取消</el-button>
          <el-button type="primary" @click="Confirm"> 确定 </el-button>
        </div>
      </template>
    </el-dialog>
  </div>
</template>

<style scoped lang="scss">
.contianer {
  .menu-item {
  }
}
.menu-item:hover {
  color: rgba(#00ff00, 0.7);
  border-bottom: 1px solid #42b883;
}

.active {
  color: rgba(#00ff00, 0.7);
}

.loginb{
  border: #cccccc solid 1px;
  width: 40px;
  height: 30px;
  margin-left: 15px;  
  background-color: transparent;
}
.loginb:hover{
  background-color:rgba(32, 165, 241 ,.5);
  border:none
}

.article{
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
  gap: 10px;
  .article-item{
    cursor: pointer;
  }
}
</style>
