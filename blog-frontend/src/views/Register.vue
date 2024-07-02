<script setup>
import axios from "axios";
import { reactive, ref } from "vue";
import { ElMessageBox } from "element-plus";
import { useRouter } from 'vue-router'
import {Lock, User} from "@element-plus/icons-vue";

// do not use same name with ref
const form = reactive({
  username: "",
  password: "",
});

var dialogVisible = ref(false);
const msg = ref();
const ruleFormRef = ref();
const rules = reactive({
  username: [{ required: true, message: "请输入用户名", trigger: "blur" },{ min: 2, max: 16, message: '长度在 1 到 16 个字符', trigger: 'blur' }],
  password: [{ required: true, message: "请输入密码", trigger: "blur" },{ min: 3,  message: '密码长度要大于3', trigger: 'blur' }],
});


const router = useRouter()

const goLogin=()=>{
  router.push({name:"Login"})
}

 
const submitForm = async (formEl) => {
  if (!formEl) return;
  await formEl.validate((valid, fields) => {
    if (valid) {
      axios
        .post("http://127.0.0.1:8080/users/register", {
          id: "",
          uid: "",
          username: form.username,
          password: form.password,
          enrollment: "",
        })
        .then((response) => {
          dialogVisible.value = true;
          if (response.data.code == "200") {
            msg.value =
              "注册成功！您的用户名为：" + response.data.data + "  请妥善保管.";
          } else {
            msg.value = "注册失败！ " + response.data.message;
          }
        })
        .catch((error) => {
          console.log(error);
        });

      console.log("submit!");
    } else {
      console.log("error submit!", fields);
    }
  });
};

 
</script>

<template>
  <div class="container">
    <el-card class="card">
      <template #header>
        <div class="card-header">
          <span>注册界面</span>
        </div>
      </template>
      <div class="box">
      <div class="pic">
        <img src="../assets/logo.png" alt="" />
      </div>
      <el-form
        :model="form"
        label-width="auto"
        style="max-width: 600px"
        ref="ruleFormRef"
        :rules="rules"
      >
        <el-form-item label="用户名:" prop="username">
          <el-input v-model="form.username" placeholder="请输入用户名" >
            <template #prefix>
              <el-icon ><user /></el-icon>
            </template>
          </el-input>
        </el-form-item>

        <el-form-item label="密&nbsp;&nbsp;&nbsp;码:" prop="password">
          <el-input v-model="form.password" placeholder="请输入密码" type="password">
            <template #prefix>
              <el-icon ><Lock /></el-icon>
            </template>
          </el-input>
        </el-form-item>

        <el-form-item>
          <el-button style="width: 100%" type="primary" @click="submitForm(ruleFormRef)">注册</el-button>
        </el-form-item>

        <div>
          <span class="Login1" @click="goLogin" >去登录</span>
        </div>

      </el-form>
    </div>
    </el-card>
  </div>

  <el-dialog v-model="dialogVisible" title="Tips" width="500">
    <span>{{msg}}</span>
    <template #footer>
      <div class="dialog-footer">
        <!-- <el-button @click="dialogVisible = false">Cancel</el-button> -->
        <el-button type="primary" @click="dialogVisible = false">
          确认
        </el-button>
      </div>
    </template>
  </el-dialog>
</template>



<style scoped lang="scss">
.container {
  height: 100vh;
  width: 100%;
  background: #f3f3f3;
  background: url("../../images/background.jpg");
  background-size: 100% 100%;
  position: fixed;
  // background-image: linear-gradient(to bottom, #84fab0 0%, #8fd3f4 100%);
  .card {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    width: 40%;
    background-color:rgba(255,255,255,0.7);
    border: none;
    text-align: center;
    font-size: 30px;
    font-weight: bold;
    .box{
      display: flex;
      justify-content: space-between;
      text-align: right;
      .pic{
        position: relative;
        img{
          position: absolute;
          top: 50%;
          transform: translate(0, -50%);
        }
      }
    }
  }
}

.goLogin{
  cursor: pointer;
    color:rgb(95, 95, 225);
}
.Login1{
  cursor: pointer;
  color:blue;
  font-size: 16px;
  font-weight: bold;
}
</style>
