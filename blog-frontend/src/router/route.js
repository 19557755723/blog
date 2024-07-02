export const routes=[
    {
        path: '/',       
        redirect:"/layout"
    },
    {                    //每一个链接都是一个对象
        path: '/register',         //链接路径
        name: 'Register',     //路由名称，
        component: () => import("../views/Register.vue")   //对应的组件模板
    },
    {                    
        path: '/login',     
        name: 'Login',    
        component: () => import("../views/Login.vue")
    },
    {
        path: '/layout',         //链接路径
        name: 'Layout',     //路由名称，
        component: () => import("../views/layout/index.vue"),   //对应的组件模板
        children:[
            {
                path: '/layout/detail/:id',     
                name: 'ArticleDetail',     
                component:  () => import("../views/layout/ArticleDetail.vue")
            }
        ]
    },
]