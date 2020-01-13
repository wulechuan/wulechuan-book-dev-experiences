# 吴乐川如何搭建 Vue 2.x 项目

## 一次性准备工作

下述步骤在一台计算机的一个账号上仅需执行一次，日后无需再次执行。

> 如果一台电脑上有多个账号，且都需要各自独立创建 Vue 项目。则下述步骤须为每个账号各执行一次。

1.  安装 `vue-cli` 3.x 版本。

	> 这是 Vue 官方出品的、与 Vue 配套使用的命令行工具，用于创建、管理 Vue 项目。它强大且方便，如今还配备了直观的网页式用户界面，以至于其名称中的 “`cli`” 一词已经不那么贴切了。

	```bash
	npm i -g vue-cli
	```


1.  配置 `~/.vuerc`。

	> 该文件名虽名为 `.vuerc` 名称中并不带 `.json` 扩展名，但其实是一个正宗的 `JSON` 文件。其内容须是标准的 `JSON` 代码。

	1.  ```bash
		code ~/.vuerc
		```


	2.  在 `~/.vuerc` 中填入下列内容：

	<details>
	<summary><code>.vuerc</code> 完整范文</summary>

	> 注意，其中包含了名为 `wulechuan-vuejs-project-config-default` 的配置项。

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


1.  安装吴乐川的 MarkDown 文件处理工具。

	```bash
	npm    i    -g    @wulechuan/markdown-to-html-via-cli
	```


---


## 创建项目并对其进行自定义配置

### 创建项目

1.  创建项目。可以采取以下两种方法之任一：

	-   纯命令行方式。

		```bash
		vue    create    你的项目名称
		```

	-   网页式界面方式（推荐）。

		```bash
		vue    ui
		```



### 对项目进行必要配置

#### 修订 `/public/index.html`

1.  将 `<html>` 标签的 `lang` 设为 `"zh-Hans-CN"`

1.  将 `<title>` 的内容改为正确的项目名称

1.  将 `<noscript>` 标签中的文字替换为：

	```html
	你的浏览器禁用了或者根本不支持 JavaScript，因此无法运行《你的项目名称》前端应用程序。
	```




### 对项目进行符合吴乐川个人偏好的配置

#### 令所有 `.vue` 文件自动加载公共样式

我们会设计一些公共的、跨组件的 CSS 样式。这些样式书写在单独的 `.css` 文件（或者 `.less` 、 `.sass`、`.scss`、 `.styl`）中。依据 Vue 项目的默认配置，这些单独的文件不会被 webpack 加载并组合、编译，更不会存放到 `dist` 文件中。我们须手工添加额外的配置，使得 webpack 在构建项目时也包含这些单独的样式文件。

> 参阅：《[Vue-CLI 官方文档的相关章节](https://cli.vuejs.org/zh/guide/css.html#%E8%87%AA%E5%8A%A8%E5%8C%96%E5%AF%BC%E5%85%A5)》

步骤如下：

> 此处我们以 `stylus` 语言为例子。


1.  安装 `style-resouces-loader` 包。

	```bash
	npm    i    -D    style-resources-loader
	```


2.  修改 Vue 项目的根文件夹内的 `vue.config.js` 的内容，使之进一步自动修订 webpack
	选项。最终目的是，令 webpack 在打包时全自动的“隐式”为所有 `.vue` 文件自动引入独立的
	`styl` 文件。一个修订好的、完整的 `vue.config.js` 范本如下：

	<details>
	<summary><code>vue.config.js</code> 完整范文</summary>

	> 顺便指出：该范文额外携带了 `disableAllCSSModules` 函数，顾名思义，其目的是强制性禁止模块化样式定义（即 `CSS Module是`）之功能。但实际上，该功能不必强行禁止，因为任何 `.vue` 文件中，凡不配备 `module` 字样的 `<style>` 标签，都不会被视作 `CSS Module`。因此，下方范文中 `disableAllCSSModules` 的函数定义和函数调用均可删除。

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






	如果不想进行上述 `vue.config.js` 配置改动，也可以尝试在一个 `.vue` 文件中的 `<script>` 标签中书写 `import '@/styles/index.styl'`

	> 注意！不是在 `<style lang="stylus">` 标签中写 `@import`，而是在 `<script>` 标签中写 `import`，且注意**不带** `@`。






#### 去除 `HelloWorld.vue` 中 `<style>` 标签上的 `scoped` 标记

Vue-CLI 工具自动创建出来的 `HelloWorld.vue` 文件中，其样式标签（`<style ...>`）是携带 `scoped` 标记的！如果不打算使用所谓“组件化样式”，千万记得去除该标记！



#### 为项目添加与文档编撰相关的功能

1.  在 `package.json` 文件中的 `scripts` 配置项，添加以下条目：

	```json
	"generate-html-docs": "rm -f ./Read*.html & find ./documents -type f -name '*.html' -delete    &&    wlc-md-to-html  -i ./*.md,./documents/**/*.md  -e  -E3  -C ./documents/wlc-md-to-html.config.js  --to '*'"
	```

1.  在项目根文件夹内创建新的文件夹，名为 `documents`。

1.  在上一步创建好的 `documents` 文件夹内，创建一个文件，名为 `wlc-md-to-html.config.js`。在该 `.js` 文件中填写如下内容：

	<details>
	<summary><code>wlc-md-to-html.config.js</code> 全文</summary>

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





#### 更新 `ReadMe.md 文档`

范文如下。

<details>
<summary><code>ReadMe.md</code> 范文（有待填写的空白）</summary>

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
\`\`\`

```

</details>









#### 添加用于查阅 webpack 最终配置的脚本项目

1.  在 `package.josn` 文件中，添加一个用于查阅 webpack 最终配置的脚本项目。如下：

	```json
	"inspect-webpack-config": "echo /* eslint-disable */ var shit = > ./temp/shit-webpack.js    &&    vue inspect >> ./temp/shit-webpack.js"
	```


