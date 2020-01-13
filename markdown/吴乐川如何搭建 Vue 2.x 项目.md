# 吴乐川如何搭建 Vue 2.x 项目

---

## 一次性准备工作

下述步骤在一台计算机的一个账号上仅需执行一次，**日后无需再次执行**。

> 如果一台电脑上有多个账号，且都需要各自独立创建 Vue 项目。则下述步骤须为每个账号各执行一次。

### 安装 `vue-cli`

一般的，对于创建和管理采用 Vue 2.x 的项目，应安装 `vue-cli` 3.x 版本。

> [Vue-CLI](https://cli.vuejs.org/zh/) 是 Vuejs 官方出品的、与 Vue 配套使用的命令行工具，用于创建和管理 Vue 项目。它强大且方便，如今还配备了直观、易用的**网页式图形用户界面**，以至于其名称中的 “`cli`” 一词已经不那么贴切了。

步骤：

```bash
npm    i    -g    @vue/cli
```

---


### 不妨预先配置好 `~/.vuerc`

配置 `~/.vuerc` 不是必须的步骤，但却非常推荐这样做。其目的是在 `~/.vuerc` 文件中记载符合个人偏好的配置项，使得日后在日常构建全新的 vue 项目时，异常方便！

> 注释 1：
>
> `.vuerc` 这一文件，虽然其文件名中并不带有 `.json` 扩展名，但其实它是一个正宗的 `JSON` 文件。其内容须是标准的 `JSON` 代码。


> 注释 2：
>
>`~` 是 Linux 家族各系统以及苹果公司的 “macOS” 系统（原名 “Mac OSX” 系统）中的特殊文件夹。故不难理解，`~/.vuerc` 则表示，存放在 `~` 文件夹内的、名为 `.vuerc` 的文件。
>
> > 顺便指出，以英文句点（`.`）作为文件名的开头，这是允许的做法。并且，凡以文件名以英文句点（`.`）开头的文件，在 Linux 家族系统或 macOS 系统中，都是隐藏文件，即默认不可见。
>
> 在微软公司的 Windows 系统下，`~` 则代表 `c:\Users\你的真实用户名\` 这个文件夹。因此，在 Windows 系统下，`~/.vuerc` 实际上就是 `c:\Users\某某某\.vuerc`。
>
> > 并且，在 Windows 系统下，文件名以英文句点（`.`）开头的文件，**并不是**隐藏文件。


具体步骤：

1.  用文本编辑器，例如 VSCode，打开 `~/.vuerc`。

    > 可以借助命令行方便的做到，如下：
    >
    > ```bash
    > code    ~/.vuerc
    > ````


2.  在`~/.vuerc` 中填入下列内容：

<details>
<summary>《<code>.vuerc</code>》完整范文</summary>

> 注意到，其中包含了名为 `wulechuan-vuejs-project-config-default` 的配置项。
>
> 并且，**初学者千万注意**，该配置项有针对 “**[TypeScript](https://www.tslang.cn/)**” 语言的配置内容！如果你不会采用 TypeScript 语言编写网页程序，请略过整个“预先配置 `~/.vuerc` 的工作”！

```json
{
    "useTaobaoRegistry": true,
    "presets": {
        "wulechuan-vuejs-project-config-default": {
            "useConfigFiles": true,
            "plugins": {
                "@vue/cli-plugin-typescript": {
                    "classComponent": true
                },
                "@vue/cli-plugin-router": {
                    "historyMode": false
                },
                "@vue/cli-plugin-vuex": {},
                "@vue/cli-plugin-eslint": {
                    "lintOn": []
                }
            },
            "cssPreprocessor": "stylus",
            "configs": {
                "eslintConfig": {
                    "rules": {
                        "no-unused-vars": 0,
                        "import/no-unresolved": 0,
                        "import/no-extraneous-dependencies": 0,
                        "no-implicit-globals": 0,
                        "indent": ["error", 4, {
                            "SwitchCase": 1,
                            "MemberExpression": 1
                        }],
                        "vue/html-indent": ["error", 4, {
                        }],
                        "vue/html-self-closing": ["error", {
                            "html": {
                                "void": "never",
                                "normal": "never",
                                "component": "never"
                            }
                        }],
                        "no-trailing-spaces": ["error", {
                            "skipBlankLines": false,
                            "ignoreComments": false
                        }],
                        "linebreak-style": [0, "unix"],
                        "no-param-reassign": 0,
                        "quotes": ["error", "single"],
                        "semi": ["error", "never"],
                        "max-statements": [0, 32],
                        "multiline-ternary": ["error", "always-multiline"],
                        "new-parens": [1],
                        "yoda": ["error", "never"],
                        "comma-dangle": ["error", {
                            "arrays": "always-multiline",
                            "objects": "always-multiline",
                            "imports": "always-multiline",
                            "exports": "always-multiline",
                            "functions": "never"
                        }],
                        "func-names": [0, "as-needed"],
                        "no-return-assign": "error",
                        "no-new-func": "error",
                        "no-eval": "error",
                        "no-implied-eval": "error",
                        "prefer-const": "error",
                        "arrow-body-style": 0,
                        "prefer-destructuring": ["error",
                            {
                                "VariableDeclarator": {
                                    "array": true,
                                    "object": true
                                },
                                "AssignmentExpression": {
                                    "array": false,
                                    "object": false
                                }
                            },
                            {
                                "enforceForRenamedProperties": false
                            }
                        ]
                    }
                }
            }
        }
    }
}
```

</details>


---


### 全局安装一些的辅助工具

#### 全局安装 `mkdirp`

> 由于 `@vue/cli` 恰巧包含了 `mkdirp`，故此步骤并非必须。

```bash
npm    i    -g    mkdirp
```

---


#### 全局安装 `rimraf`

> 由于 `@vue/cli` 恰巧包含了 `rimraf`，故此步骤并非必须。

```bash
npm    i    -g    rimraf
```


---


#### 全局安装吴乐川的 MarkDown 文件处理工具

该项工作的目的是安装一个工具，用于日后将 MarkDown 文件（`.md`）自动批量转换成对应的 HTML 网页文件(`.html`)。**HTML 网页版本的文档更便于查阅或分发。**

显然，**该项工作并非必须**。但我推荐这样做。毕竟，管理好项目文档是举足轻重之事。

> 另，该项工作须安装吴乐川自行编写并维护的工具，因此有广告之嫌。见谅。


操作步骤：

```bash
npm    i    -g    @wulechuan/markdown-to-html-via-cli
```


---










## 日常创建 Vuejs 项目并对其进行自定义配置

### 创建 Vuejs 2.x 项目

1.  创建项目。可以采取以下两种方法之**任一**：

    -   网页式界面方式（**推荐**）。

        ```bash
        vue    ui
        ```

    -   古典的（或者说传统的）纯命令行方式。

        ```bash
        vue    create    你的项目名称
        ```


---


### 对项目进行必要配置

#### 修订 `/public/index.html`

1.  将 `<html>` 标签的 `lang` 设为 `"zh-Hans-CN"`

1.  将 `<title>` 的内容改为正确的项目名称

1.  将 `<noscript>` 标签中的文字替换为：

    ```html
    你的浏览器禁用了或者根本不支持 JavaScript，因此无法运行《你的项目名称》前端应用程序。
    ```

综上，你将得到的《`index.html`》文件将类似如下范本：

<details>
<summary>《<code>index.html</code>》完整范文</summary>

```html
<!DOCTYPE html>
<html lang="zh-Hans-CN"> <!-- 注意，这行修订了。 -->
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width,initial-scale=1.0">
        <link rel="icon" href="<%= BASE_URL %>favicon.ico">
        <title>你的项目名称</title> <!-- 注意，这行修订了。 -->
    </head>
    <body>
        <noscript>
            <!-- 注意，下一行修订了。 -->
            <strong>你的浏览器禁用了或者根本不支持 JavaScript，因此无法运行《你的项目名称》前端应用程序。</strong>
        </noscript>
        <div id="app"></div>
        <!-- built files will be auto injected -->
    </body>
</html>

```

</details>


---



### 对项目进行迎合吴乐川个人偏好的配置

#### 令所有 `.vue` 文件自动加载公共样式

我们会设计一些公共的、跨组件的 CSS 样式。这些样式书写在单独的 `.css` 文件（或者 `.less` 、 `.sass`、`.scss`、 `.styl`）中。依据 Vue 项目的默认配置，这些单独的文件不会被 webpack 加载并组合、编译，更不会存放到 `dist` 文件中。我们须手工添加额外的配置，使得 webpack 在构建项目时也包含这些单独的样式文件。

> 参阅[《Vue-CLI 官方文档》的相关章节](https://cli.vuejs.org/zh/guide/css.html#%E8%87%AA%E5%8A%A8%E5%8C%96%E5%AF%BC%E5%85%A5)。

步骤如下：

> 此处我们以 `stylus` 语言为例。


1.  安装 `style-resouces-loader` 包。

    ```bash
    npm    i    -D    style-resources-loader
    ```


2.  修改 Vue 项目的根文件夹内的 `vue.config.js` 的内容，使之进一步自动修订 webpack
    选项。最终目的是，令 webpack 在打包时全自动的“隐式”（或者说”暗中“）为所有 `.vue`
    文件自动引入独立的 `styl` 文件，从而使得所有 `.vue` 都可以使用由该 `.styl`
    文件所导入的所谓“公共的”样式。

    一个修订好的、完整的《`vue.config.js`》范本如下：

    <details>
    <summary>《<code>vue.config.js</code>》完整范文</summary>

    > 顺便指出：该范文额外携带了 `disableAllCSSModules` 函数并调用了该函数。顾名思义，该函数之功能是强制禁止模块化样式定义（即 `CSS Module是`）之功能。但实际上，该功能不必强行禁止，因为任何 `.vue` 文件中，凡不配备 `module` 字样的 `<style>` 标签，都不会被视作 `CSS Module`。因此，下方范文中 `disableAllCSSModules` 的函数定义和函数调用均可删除。

    ```js
        const path = require('path')
    module.exports = {
        lintOnSave: false,

        chainWebpack: config => {
            const chainableModule = config.module
            implicitlyInjectSharedStylusIntoAllVueModules(chainableModule)
            disableAllCSSModules(chainableModule) // 该行可删除。
        },
    }

    function disableAllCSSModules(chainableModule) { // 该定义可完全删除。
        // rule(...)
        const ruleTypes = ['css', 'postcss', 'scss', 'sass', 'less', 'stylus']

        // oneOf(...)
        const vueModuleTypes = ['vue-modules', 'vue', 'normal-modules', 'normal']

        // use(...)
        const loaderTypes = ['css-loader']

        ruleTypes.forEach(ruleType => {
            vueModuleTypes.forEach(moduleType => {
                loaderTypes.forEach(loaderType => {
                    chainableModule.rule(ruleType).oneOf(moduleType).use(loaderType).options({
                        modules: false,
                    })
                })
            })
        })
    }

    function implicitlyInjectSharedStylusIntoAllVueModules(chainableModule) {
        // https://cli.vuejs.org/zh/guide/css.html#%E8%87%AA%E5%8A%A8%E5%8C%96%E5%AF%BC%E5%85%A5

        // oneOf(...)
        const vueModuleTypes = ['vue-modules', 'vue', 'normal-modules', 'normal']

        const stylusRule = chainableModule.rule('stylus')
        vueModuleTypes.forEach(moduleType => {
            stylusRule.oneOf(moduleType)
                .use('style-resource')
                .loader('style-resources-loader')
                .options({
                    patterns: [
                        path.resolve(__dirname, './src/styles/javascript-auto-import.styl'),
                    ],
                })
        })
    }
    ```

    </details>






    如果不想进行上述对《`vue.config.js`》的改动，即不想令所有 `.vue`
    文件自动隐式（或者说暗中）引用公共样式文件，但在某个或某些特定的 `.vue`
    文件中又确实需要使用这类样式文件，则可在这个或这些 `.vue` 文件中的
    `<script>` 标签中，手工明确书写类似这样的语句：

    ```js
    import '@/styles/index.styl'
    ```

    > 千万注意！不是在 `<style lang="stylus">` 标签中书写
    > CSS 的 `@import` 语句，而是在 `<script>` 标签中书写
    > JavaScript 的 `import` 语句。并且，恰因为书写的是 JavaScript
    > 而不是 CSS，`import` 一词之前是**不冠以** `@` 的。


---



#### 禁用所谓“组件化样式”（Scoped CSS）

> 本节关键词： `scoped CSS`、`去除 scoped CSS`、`禁用 scoped CSS`、`关闭 scoped CSS`、`删除 CSS 选择器中的[data-v-xxxxxx]`。

所谓“组件化样式”，英语是“scoped style”或“scoped CSS”。

Vue-CLI 工具自动创建出来的《`HelloWorld.vue`》文件中，其样式标签（`<style ......>`）是携带 `scoped` 标记的！即，默认情况下，这些 Vue 项目是开启了“组件化样式”之功能的。如果不打算使用“组件化样式”，千万记得去除该标记！

即，将：

```html
<style scoped lang="stylus">
```

改为：

```html
<style lang="stylus">
```

那么，则什么情况下不应该使用所谓“组件化样式”呢？

1.  你是初学者，并不理解什么是“scoped CSS”，也不打算使用这样的功能。

2.  你虽然理解“scoped CSS”，但很确信该项目不需要使用这样的功能。

3.  你在没有对项目的 webpack 配置（实则经由《`vue.config.js`》间接配置 webpack）进行深入修订，同时，又参照了上文《[令所有 `.vue` 文件自动加载公共样式](#令所有-.vue-文件自动加载公共样式)》一节中，在每个 `.vue` 文件中“暗中”加载位于单独样式文件中的公共样式。

    原因是，当你对 webpack 的配置修订较为简单、潦草、为切中要害时，暗中加载的公共样式也会被编译成“scoped”的形式。而这些公共样式是不对应到具体的组件的，因而不对应到任何 vue 能预知的 DOM 元素上。换句话说，一些“普通”的 DOM 元素，例如 `<html>` 或 `<button>` 等，并不会被 webpack 添加针对 scoped CSS 的额外标记。**简单的说，“_暗中加载公共样式_”外加“_某个组件采用的 scoped CSS_”这样的配置组合，将使得这些公共样式彻底失效！**

    > 具体怎样才算是对 webpack 配置做更“精细”的修订，从而使公共样式不受某个 `.vue` 组件的“`<style scoped>`”的干扰呢？
    >
    > 很遗憾，我暂时没有空研究整理出可行的方案。**须待日后补充。**

---


#### 为项目添加与文档编撰相关的功能

> 注意，为了使得该功能彻底自动化并且通用于 Windows 系统、Linux 家族习题以及 macOS 系统，应该先行安装 `rimraf` 这个 npm 包。见上文《[全局安装 `rimraf`](#全局安装-rimraf)》一节。


##### 配置步骤

1.  在《`package.json`》文件中的 `scripts` 配置项，添加以下两则条目：

    ```json
    "remove-all-html-docs": "rimraf  ./readme.html  ./documents/**/*.html",
    "generate-html-docs": "npm  run  remove-all-html-docs    &&    wlc-md-to-html  -i ./*.md,./documents/**/*.md  -e  -E3  -C ./documents/wlc-md-to-html.config.js  --to '*'",
    ```

1.  在项目根文件夹内创建新的文件夹，名为 `documents`。

1.  在上一步创建好的 `documents` 文件夹内，创建一个文件，名为 `wlc-md-to-html.config.js`。在该 `.js` 文件中填写如下内容：

    <details>
    <summary>《<code>wlc-md-to-html.config.js</code>》全文</summary>

    ```js
    /*
        参考（中文）：
            https://github.com/wulechuan/wulechuan-js-generate-html-via-markdown/blob/HEAD/ReadMe.zh-hans-CN.md#%E5%85%A5%E5%8F%A3%E5%8F%82%E6%95%B0
        References (English):
            https://github.com/wulechuan/wulechuan-js-generate-html-via-markdown/blob/HEAD/ReadMe.md#arguments
    */
    module.exports = {
        conversionOptions: {
            articleTOCBuildingHeadingLevelStartsFrom: 2,
            articleTOCListTagNameIsUL: true,
        },
        manipulationsOverHTML: {
            shouldNotReplaceLineBreaksInCodeTagsWithBrTags: false,
            desiredReplacementsInHTML: [
                {
                    from: /\s+href="([^#])/gi,
                    to: ' target="_blank" href="$1',
                },
                {
                    from: /\s+href="(.+)\.md"/gi,
                    to: ' href="$1.html"',
                },
            ],
            absolutePathsOfExtraFilesToEmbedIntoHTML: [],
        },
        sundries: {
            shouldConsoleLogsInChinese: true,
            shouldDisableCachingForInternalThemeFiles: false,
            shouldDisableCachingForExternalFiles: false,
        },
    }

    ```

    </details>


##### 日常使用步骤

```bash
npm    run    generate-html-docs
```


---


#### 更新《`ReadMe.md`》


维护好项目文档，记载必要的备忘或说明，举足轻重。


《`ReadMe.md`》范文如下。

<details>
<summary>《<code>ReadMe.md</code>》范文（<strong>部分词句有待替换成真实内容</strong>）</summary>

```md
# 某某项目的WEB前端子项目

---

## 在浏览器中运行

-   [http://localhost:你的研发项目端口号](http://localhost:你的研发项目端口号)（此链接会新开一个浏览器页签）

---

## 开发环境搭建和日常使用

### 搭建（即一次性动作）

1.  创建文件夹并 `cd` 该文件夹。例如：

    ```bash
    mkdir    -p    你研发计算机上的真实路径
    cd             你研发计算机上的真实路径
    ```

1.  克隆并下拉最新的代码。

    ```bash
    git    clone    真实的git仓库URI
    ```

1.  安装 npm 包。

    ```bash
    npm    i
    ```

### 使用（即每日研发的重复性动作）

-   创建研发分支

    ```bash
    git    br          你的新分支的名称
    git    checkout    你的新分支的名称
    ```

-   执行面向研发阶段的编译，并启用【即时刷新】（hot-reloads）功能。

    ```bash
    npm    start
    ```

-   执行 Lint 并自动修复文件中的某些错误。

    ```bash
    npm    run    lint
    ```



### 研发环境配置要领

#### Vuejs 环境构建官方指南
-   [《构建配置》中文版](https://cli.vuejs.org/zh/config/)（此链接会新开一个浏览器页签）
-   [《构建配置》英文版](https://cli.vuejs.org/config/)（此链接会新开一个浏览器页签）


---


## 后端服务 API

待详。

---

## 生产环境部署

### 在全新服务器上第一次部署代码

1.  创建文件夹并 `cd` 该文件夹。例如：

    ```bash
    mkdir    -p    你的真实路径
    cd             你的真实路径
    ```

1.  克隆并下拉最新的代码。

    ```bash
    git    clone    真实的git仓库URI
    ```

1.  安装 npm 包并将前端代码打包成最终发布用的代码。

    ```bash
    npm    i
    npm    run    build
    ```

### 在已经部署过的旧有服务器上翻新代码

1.  `cd` 到正确的文件夹。例如：

    ```bash
    cd    你的真实路径
    ```

1.  确保 git 分支是 `master`。下拉最新的代码。

    ```bash
    git    checkout    master
    git    pull
    ```

1.  按需先行安装 npm 包。

    > 很显然，该步骤并非必须，但强烈推荐！

    ```bash
    npm    i
    ```

1.  执行打包命令。待详。

    ```bash
    npm    run    build
    ```

---



## 开发文档管理

根据 MarkDown 文件，逐一生成对应的 HTML 文件。HTML 版本的文件便于查阅或分发。

```bash
npm    run    generate-html-docs
\```

```

</details>




---




#### 添加用于查阅 webpack 最终配置的 npm “`scripts`” 条目

> 注意，为了使得该功能彻底自动化并且通用于 Windows 系统、Linux 家族习题以及 macOS 系统，应该先行安装 `mkdirp` 这个 npm 包。见上文《[全局安装 `mkdirp`](#全局安装-mkdirp)》一节。

##### 配置步骤

具体做法如下：在《`package.josn`》文件中，添加一个**用于查阅 webpack 最终配置**的脚本（`scripts`）条目。如下：

```json
"inspect-webpack-config": "mkdirp  temp    &&    echo /* eslint-disable */ var shitWebpackConfig =  >  ./temp/shit-webpack.config.js    &&    vue  inspect  >>  ./temp/shit-webpack.config.js"
```

##### 日常使用步骤

1.  在命令行环境执行：

    ```bash
    npm    run    inspect-webpack-config
    ```

2.  打开 `temp/shit-webpack.config.js`。

---



