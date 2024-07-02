<script setup>
import { reactive,ref,onMounted } from "vue";
import { useRouter } from "vue-router";
import { ElMessage } from 'element-plus'
import axios from "axios";
import {Lock, User} from "@element-plus/icons-vue";
const router=useRouter()
// do not use same name with ref
const form = reactive({
  username: "",
  password: "",
});

const ruleFormRef = ref()
const rules = reactive({
  username:[
    {required: true, message: '请输入用户名', trigger: 'blur'}
  ],
  password:[
    {required: true, message: '请输入密码', trigger: 'blur'}
  ],
})

const open2 = () => {
  ElMessage({
    message: '登录成功!',
    type: 'success',
  })
  
}

const open1 = (msg) => {
  ElMessage.error(msg)
}

const goRegister=()=>{
  router.push({name:"Register"})
}


const submitForm = async (formEl) => {
  if (!formEl) return
  await formEl.validate((valid, fields) => {
    if (valid) {

       axios
        .post("http://127.0.0.1:8080/users/login", {
          uid: form.username,
          password: form.password,
          
        })
        .then((response) => {
          if (response.data.code == "200") {
             open2()
             localStorage.setItem("userId",form.username)
             router.replace({name:"Layout"})
             router.push({name:"Layout"})
          } else {
            open1(response.data.message)
          }
        })
        .catch((error) => {
          console.log(error);
        });

      console.log('submit!')
    } else {
      console.log('error submit!', fields)
    }
  })
}
</script>

<template>
  <div class="container">
    <el-card class="card">
      <template #header>
        <div class="card-header">
          <span class="center-text">系统登录</span>
        </div>
      </template>
      <div class="box">
      <div class="pic">
        <img src="../assets/logo.png" alt="" />
      </div>
      <el-form class="el" :model="form" label-width="auto" style="max-width: 600px"  ref="ruleFormRef" :rules="rules">
        <el-form-item label="用户名:" prop="username">
          <el-input v-model="form.username" placeholder="亲,请输入用户名"  >
            <template #prefix>
              <el-icon ><user /></el-icon>
            </template>
          </el-input>
        </el-form-item>

        <el-form-item label="密&nbsp;&nbsp;&nbsp;码:" prop="password">
          <el-input  v-model="form.password"  placeholder="亲,请输入密码" type="password">
            <template #prefix>
              <el-icon ><Lock /></el-icon>
            </template>
          </el-input>
        </el-form-item>

        <el-form-item>
          <el-button style="width: 100%" type="primary" @click="submitForm(ruleFormRef)">登录</el-button>
        </el-form-item>

        <el-form-item>
           <div>
               没有账号？<span class="goRegister" @click="goRegister">去注册</span>
           </div>
        </el-form-item>
      </el-form>     
    </div> 
    </el-card>
  </div>
</template>

<style scoped lang="scss">


.container {
  height: 100vh;
  width: 100%;
  background: url("../../images/background.jpg");
  background-size: 100% 100%;  //设置图片大小
  position: fixed;
   //background-image: linear-gradient(to bottom, #84fab0 0%, #8fd3f4 100%);
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

  .goRegister{
    cursor: pointer;
    color:blue;
  }
}

</style>
