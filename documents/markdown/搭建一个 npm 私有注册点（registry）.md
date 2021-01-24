<link rel="stylesheet" href="../node_modules/@wulechuan/css-stylus-markdown-themes/dist/css/wulechuan-styles-for-html-via-markdown--vscode.default.min.css">


# 搭建和维护 npm 私有注册点（registry）

2020-08-04


## npm 生态的介绍

采用 JavaScript 编写的工具，非但可以运行在诸如火狐浏览器这样的环境中，也可以运行在 Nodejs 营造的环境中。

有不少 JavaScript 工具是面向 Nodejs 环境的，它们自然可以透过 Nodejs 的配套工具来方便的管理和使用。同时，一些 JavaScript 工具即便是针对火狐浏览器这类环境的，依旧可以依托 Nodejs 的配套工具来管理。于是，不论 JavaScript 程序面向什么样的运行环境，其管理手段得到了统一。这个 Nodejs 的配套管理工具即是“**npm**”。

所谓“`npm`”，是英语“`nodejs package manager`”的缩写，意为“用于管理 Nodejs 包的工具”。它由 npmjs 组织设计，并提供给公众。

如今，对于 JavaScript 开发人员，特别是 Web 前端开发人员而言，npm 已经是不可或缺的工具。

> npmjs 组织已归入微软公司旗下的 GitHub 公司。


### npm 服务系统

作为一个宽泛的概念，npm 不单单指一款工具，它同时也指一种提供服务的系统。成千上万的程序员可以自由的将自己编写的 JavaScript 工具发布到该系统中。这些工具会在该系统中登记，或者说注册，形成庞大的工具库。任何开发者也可以自由的从该系统数以万计 JavaScript 工具中，选择所需的工具，下载并加以利用。**人人为其贡献，人人在其中分享。**

npmjs 组织凭借 [https://www.npmjs.com](https://www.npmjs.com) 这一网站提供上述服务。

**我们不妨将该套服务系统称为“【npm 服务系统】”。**【npm 服务系统】会配合上述网站（即 [https://www.npmjs.com](https://www.npmjs.com)），使得查询数以万计的 JavaScript 代码变得直观、方便。


### npm 包

虽然任何人写的任何 JavaScript 工具都可以免费发布在 npm 服务系统中。但一个 JavaScript 包要在上述系统中正确登记、管理和分发，必须符合 npmjs 组织制定的特定的规范。因此，我们不妨将这些符合规范的包称为所谓【npm 包】。

换句话说，任何开发者要想发布一个工具，在 npmjs.com 上对全世界分享之，必须将该工具设计成一个规范的【npm 包】。然后，开发者采用 npmjs 组织设计的专门工具，将该【npm 包】发布到 npmjs.com 上。其中提到的“专门工具”在下文介绍。


### npm 工具

为方便程序员们管理和使用【npm 服务系统】中的【npm 包】，npmjs 组织提供了一个专门的工具，该工具的名称也是 `npm`。为防止混淆，下文称之为“【npm 工具】”。

**简言之，我们使用【npm 工具】来上载和下载【npm 系统服务】中【npm 包】。**

【npm 工具】也是完全用 JavaScript 编写的。**它必须运行在 Nodejs 环境中。** 另外，【npm 工具】本身也存放在【npm 服务系统】当中。这使得 【npm 工具】可以自己管理和更新自身。

> 还需注意，尽管初学者即能深切感受到【npm 工具】与 Nodejs 是紧密配合的两款软件，但二者并不是一回事。
>
> Nodejs 是一个 JavaScript 解释器，它解释任何 JavaScript 代码，运行之。仅此而已。它采用 C++ 语言写成，由 Nodejs 设计和维护。
>
> 而【npm 工具】是一款采用 JavaScript 编写的工具，由 npmjs 组织设计和维护。它用来方便的管理很多符合规范的 JavaScript 文件。用 JavaScript 设计的程序来管理 JavaScript 文件，这咋听起来有点儿绕，实则并不是奇怪的事情。



### npm 服务注册点

谈到“【npm 包】会在【npm 服务系统】中登记（注册）”，就涉及到“注册点（registry）”的概念。

所谓注册点，是一个服务器程序，它管理着一个巨大的【npm 包】库，并对外提供【npm 服务系统】之功能，包括接受【npm 包】的上载、下载、版本管理，呈现各个【npm 包】的说明书（ReadMe），以及提供其源代码的 Git 仓库链接等等。

毫无疑问，npmjs 官方提供【npm 系统服务】的途径，即是搭建了一个官方“注册点”，名为 [https://www.npmjs.com](https://www.npmjs.com)。

可以看到，[https://www.npmjs.com](https://www.npmjs.com) 这一网址是多功能的。它即是 npmjs 组织的**官方网站的地址**，又是官方提供【npm 系统服务】的**入口**，也由此作为了提供该服务的**注册点的名称**。注册点提供着服务，服务存在于注册点上，两个概念紧密相连。在日常工作中，我们其实并不对“npm 注册点”和【npm 系统服务】做概念上的严格区分，无此必要。



### 小节

一般的，要从你的工作计算机访问官方的【npm 服务系统】，有两个必要条件：

1.  安装 Nodejs 程序。别忘了，【npm 工具】须运行于 Nodejs 之上。另外，Nodejs 和【npm 工具】的合作关系一直很好，于是，Nodejs 中自带了【npm 工具】。

    > 须注意，尽管 Nodejs 总是自带了【npm 工具】，但 Nodejs 自带的【npm 工具】的版本未必是最新的。因此， 我们日常可以并且应该单独更新【npm 工具】。做法如下：
    >
    > ```bash
    > npm  i  -g  npm
    > ```

1.  你的计算机可以连接到互联网，以访问 npmjs 的所谓官方注册点，即 [https://www.npmjs.com](https://www.npmjs.com)。



---



## 什么是 npm 私有注册点？为何要搭建它？

### 什么是 npm 私有注册点

首先要明确，npmjs 允许人们自行搭建所谓注册点，提供与官方的注册点（即 [https://www.npmjs.com](https://www.npmjs.com)）完全相同的【npm 系统服务】。一个团体或个人自行准备一台计算机，想办法令其提供与官方注册点类同的【npm 系统服务】，那么该计算机即是在扮演“ npm 注册点”的角色。既然该计算机是一个团体或个人私有的，其上的 npm 注册点自然可以称作所谓“私有注册点”。

还须知，使用【npm 工具】时，可以预先配置或临时指明所需连接的 npm 注册点，以管理和使用该特定注册点上的【npm 包】，而不是像默认情形那样，总是操纵或下载位于 npmjs 官方的注册点上的【npm 包】。

**总之，我们总是使用唯一的【npm 工具】，但我们可以选择采用哪个npm 注册点。** 并且，在任何工作机上，我们都完全可以随时切换 npm 注册点，时而采用官方的注册点，时而采用某个私有的注册点。


### 搭建 npm 私有注册点的意义

通常的开发环境允许开发者们连接互联网。此时，开发者们使用官方的注册点上的资源不会遇到障碍。

然而，在不少场合，出于种种原因，我们在**不可**或**不便**或**不愿**连接外网联的环境工作。于此种情况下，欲使用【npm 系统服务】，我们应搭建所谓“私有注册点”。换句话说，我们应搭建一个运转在私有环境下的【npm 服务系统】。在该私有环境下的任何计算机，都可以透过该私有 npm 服务访问其中的【npm 包】。


### 私有注册点与官方注册点的区别

npmjs 官方的 npm 注册点维护着全球开发者贡献的【npm 包】，数量庞大，内容完整。

而私有注册点，限于各种条件，未必能提供如此庞大、完整的【npm 包】集合。更可能的情形是，一个私有注册点只能存放数量较为有限的【npm 包】。换句话说，它仅能提供有限数量的 JavaScript 工具。

当然，也不乏技术实力强大的组织，有能力提供对 npmjs 官方注册点的完整镜像。即，他们可以搭建一个 npm 注册点，并从官方注册点拉取**所有**数以十万计的【npm 包】，对公众提供与官方注册点类同的服务。

例如中国淘宝研发团队维护的 [https://developer.aliyun.com/mirror/npm/](https://developer.aliyun.com/mirror/npm/)（原 [https://cnpmjs.org/](https://cnpmjs.org/)）就是对官方注册点的完整镜像。该注册点一般被称为“`cnpm`”，相对于“`npm`”。我们亦不妨简称其为“npm 淘宝镜像”。

中国大陆境内的开发者访问 npmjs 官方的注册点，偶尔会出现连接缓慢的情形。此时，这些开发者可以将其各自计算机中安装的【npm 工具】配置为采用“npm 淘宝镜像”。那样，他们下载【npm 包】时，连接之速度、稳定性均较采用官方注册点时有明显提升。

> “npm 淘宝镜像”注册点故意仅提供下载【npm 包】的服务，不接受任何人向其上传（发布）任何【npm 包】。淘宝团自称该注册点为所谓“只读注册点”。很显然，该团队的之一努力之主旨在于令中国大陆境内的程序员可以高速下载【npm 包】，而不是彻底代替官方注册点。



---



## 如何搭建 npm 私有注册点

由上文可知，我们可以在私有环境（例如某公司之内网环境）搭建独立于 npmjs 官方注册点的所谓【**npm 私有注册点**】。搭建私有注册点，可以使公司内部的编程工作站在日常工作中摆脱对外网的连接要求，仍可安装公司私有注册点中已存在的【npm 包】。

**但须注意，私有注册点服务器本身须不定期更新其拥有的【npm 包】集合，以伺服公司内网环境中的各个编程工作站！**


### 搭建 npm 私有注册点的前提条件

**此文旨在提高尽可能详尽的搭建步骤。读者据此一劳永逸。因此，我们做了颇为苛刻的假设：**

1.  npm 私有服务器本身无法连接互联网。

2.  使用 npm 私有注册点的计算机无法连接互联网。


搭建一个 npm 私有注册点，有以下前提条件：

1.  一台用作 npm 私有注册点的计算机。部分称其为“npm 私有服务器”。

1.  搭建[npm 服务系统]的软件工具。显然，它用于在内网环境提供完整的【npm 系统服务】。本文选用较著名且现代的 `verdaccio`，见 [https://verdaccio.org/](https://verdaccio.org/)。

1.  [Nodejs](https://nodejs.org/zh-cn/) 应用程序，用于运行 `verdaccio`。

    > 须知，verdaccio 本身就是一个【npm 包】。用一个由 npm 系统提供的 JavaScript 程序，来搭建 npm 服务系统，这并不违背逻辑，不必大惊小怪。既然 verdaccio 本身就是一个【npm 包】，那么，获取 verdaccio 自然要求连接到 npmjs 官方注册点，或其镜像（例如淘宝注册点）。
    >
    > verdaccio 应该是意大利语，意味“灰绿色”。其设计的 Web 界面恰采用了灰绿色作为主色调。作为汉语使用者，我无法用准确读出该词，但我发现这一词的汉语谐音大致会是“我大丑”。确实，那灰绿色“大丑”。

1.  一个可靠的【npm 包】的来源。我们将会想办法从该【npm 包】来源批量下载成千上万的【npm 包】，并把这些包“转录”到我的私有注册点中。本文采用的【npm 包】来源即是由淘宝技术团队提供的 `cnpm`。

1.  一个用于批量采集（下载）和转录【npm 包】的工具。本文中会谈及本人自行设计的一套 bash 脚本。但诸位亦可尝试 `bulk-npm-publish` 这一工具，见 [https://www.npmjs.com/package/bulk-npm-publish](https://www.npmjs.com/package/bulk-npm-publish)。

1.  一台可以连接互联网的计算机，用于下载各种必要的工具，例如 Nodejs、verdaccio 等。



下文分 2 个小节阐述搭建 npm 私有注册点的步骤：

1.  《[在可连接互联网的计算机上做的准备工作](#在可连接互联网的计算机上做的准备工作)》。
1.  《[在 npm 私有注册点服务器上的操作](#在-npm-私有注册点服务器上的操作)》。



### 在可连接互联网的计算机上做的准备工作

由于我们故意假设了用于架设 npm 私有注册点的计算机无法联网，所以我们首先要借助一台可联网的计算机，下载必要的工具。稍后将这些工具利用 U 盘等传统媒介转移到用于架设 npm 私有注册点的计算机中去。

为方便指称，下文暂将可连接互联网的计算机称为所谓“联网机”，将用于架设 npm 私有注册点的计算机称为“私有机”。

在联网机上须做的步骤如下：

1.  在联网机上，下载适用于**联网机自身**操作系统的 Nodejs。见 [https://nodejs.org/zh-cn/](https://nodejs.org/zh-cn/)。

1.  在联网机上，下载适用于**私有机**操作系统的 Nodejs。见 [https://nodejs.org/zh-cn/](https://nodejs.org/zh-cn/)。

1.  在联网机上，下载适用于**内网工作机**操作系统的 Nodejs。见 [https://nodejs.org/zh-cn/](https://nodejs.org/zh-cn/)。

1.  在联网机上，安装 Nodejs。

1.  在联网机上，不妨更新 npm 至最晚版本。

    ```bash
    npm  i  -g  npm
    ```

1.  在联网机上，**全局**安装 verdaccio。

    ```bash
    npm  i  -g  verdaccio
    ```

1.  为方便后续对内网工作计算机进行简单但必要的配置，推荐在联网机上也安装 `nrm` 这个【npm 包】，且安装模式必须是**全局（global）** 模式。

    `nrm` 也是一款【npm 包】。其作用非常简单，即在一台计算机上方便的切换该计算机中【npm 工具】默认应连接的注册点。该工具并非必须，但如果不借助它，而是采取手工配置和切换【npm 工具】的注册点的方式，会稍嫌繁琐。因此笔者强烈推荐安装 `nrm`，以提高日常效率。


1.  在联网机上，获取用于批量转录【npm 包】的工具。本文将采用 [https://github.com/wulechuan/wulechuan-bash-publish-npm-packages-in-batch](https://github.com/wulechuan/wulechuan-bash-publish-npm-packages-in-batch)。下文简称之为“转录脚本”。

    如果不会或不愿意采用 git 客户端来获取该工具，则直接下载 [https://github.com/wulechuan/wulechuan-bash-publish-npm-packages-in-batch/archive/master.zip](https://github.com/wulechuan/wulechuan-bash-publish-npm-packages-in-batch/archive/master.zip) 即可。


1.  将下列文件夹，由联网机转移（复制）到私有机中去。

    -   适用于私有机的 Nodejs 安装包。

    -   已经在联网机上全局安装好的【npm 包】。如果谨遵上例，则在联网机上，仅存在 3 个全局安装的【npm 包】：

        1.  最新版的 `npm`。
        1.  `verdaccio`。
        1.  `nrm`。此项并非必须。

        全局安装的【npm 包】应存放在如下文件夹中：

        -   如果联网机是 Windows 系统，则为 `C:\Users\<用户名>\AppData\Roaming\npm`。
        -   如果联网机是 Linux 系统或 `macOS` 系统，则为两个文件夹，而不是一个。这两个文件夹是：
            1.  `/usr/local/lib/nodejs/node-v??.??.?-linux-x64/bin/`。
            1.  `/usr/local/lib/nodejs/node-v??.??.?-linux-x64/lib/node_modules/`。

        > 为提高将文件复制进入 U 盘的效率，建议先将 npm 文件打包成单一的 zip 文件。

    -   已经在联网机上的所谓“采集和转录脚本”。

    视具体环境之限制，可能采用 U 盘进行文件转移。也可能还需用到 SSH 功能，因为某些环境中，用作私有机的计算机无法直接操作，而是须透过 SSH 这样的工具进行远程操控。


1.  将下述文件夹，由联网机转移（复制）到内网工作机中去。

    -   适用于内网工作计算机环境的 Nodejs 安装包。
    -   已经在联网机上全局安装好的【npm 包】。如果谨遵上例，则仅转移 2 个【npm 包】：

        1.  最新版的 `npm`。
        1.  `nrm`。



### 在 npm 私有注册点服务器上的操作

我们仍将用于搭建 npm 私有注册点的计算机简称为“私有机”。

至此，我们假定私有机上已经拥有了：

-   适用于私有机的 Nodejs 安装包。

-   两个必要的【npm 包】：

    1.  最新版的 `npm`。
    1.  `verdaccio`。

    > 另，我们之前在联网机上预备好的 `nrm` 对于私有机没有太大价值。`nrm` 是针对内网工作计算机的。

-   所谓“采集和转录脚本”。

搭建和配置 npm 私有注册点的步骤如下：

1.  安装 Nodejs。

    -   如果私有机运行着 Windows 环境，则直接安装 `node-v??.??.?-x64.msi` 即可。

    -   如果私有机运行着 Linux 环境，则：

        1.  解压并安装 Nodejs。

            ```bash
            sudo    mkdir    -p     /usr/local/lib/nodejs
            sudo    tar    -xJvf    node-$VERSION-$DISTRO.tar.xz    -C  /usr/local/lib/nodejs
            ```

        2.  修订 `~/.bash_profile`。在其中添加如下内容：

            ```bash
            # Nodejs
            VERSION=v12.18.3 # 此处应填写实际的版本号。12.18.3 仅作示范用。
            DISTRO=linux-x64
            export PATH=/usr/local/lib/nodejs/node-v12.18.3-linux-x64/bin:$PATH
            ```

            > 注，官方文档修订的是 `~/.profile` 而非 `~/.bash_profile`。实则两种做法之任一均可，且不必同时采取二者。

        3.  令已修订的 `~/.bash_profile` 立即生效：

            ```bash
            source    ~/.bash_profile
            ```

        4.  不妨验证一下，确保 Nodejs 能正常运转。做法如下：

            ```bash
            node -v
            npm -v
            ```


        参阅《[How to install Node.js via binary archive on Linux](https://github.com/nodejs/help/wiki/Installation#how-to-install-nodejs-via-binary-archive-on-linux)》。


1.  将必要的两个【npm 包】**全局**安装到私有机的系统中。

    -   如果联网机上的操作系统和私有机的操作系统相同，则将从联网机取得的文件解压复制到相同的文件夹内即可。

    -   如果联网机上的操作系统是 Windows，而私有机的操作系统是 Linux，那么复制会略为麻烦。如下：

        可以观察到，来源的内容可分为两种：

        1.  直接位于 `C:\Users\<用户名>\AppData\Roaming\npm\` 文件夹内的名为 `node_modules` 的文件夹。
        1.  除上述 `node_modules` 文件夹之外的、所有直接位于 `C:\Users\<用户名>\AppData\Roaming\npm\` 文件夹内的文件。

        将二者复制进入 Linux 环境时，须区别对待！其中：

        1.  `node_modules` 文件夹应放置在 Linux 系统中的 `/usr/local/lib/nodejs/node-v??.??.?-linux-x64/lib/` 内。于是，你得到的是 `/usr/local/lib/nodejs/node-v??.??.?-linux-x64/lib/node_modules/` 这样一个文件夹。

        1.  其余所有文件，包含但不限于 `npm`、`npm.cmd`、`npm.ps1`、`nrm`、`nrm.cmd`、`nrm.ps1`、`verdaccio`、`verdaccio.cmd` 和 `verdaccio.ps1` 等等。

            其中，所有的 `.cmd` 和 `.ps1` 文件都是专门运行在 Windows 环境的，因而没必要复制到 Linux 环境中，可以略过。当然，复制进入 Linux 系统也没有任何负面影响，它们对 Linux 是无意义的。

            我们的重点是将所有**不带**后缀名的文件（例如 `npm`、`nrm` 和 `verdaccio` ）复制进入 Linux 系统中。并且，这些文件都应放置在 Linux 系统中的 `/usr/local/lib/nodejs/node-v??.??.?-linux-x64/bin/` 文件夹内。

            由于这些文件来源于 Windows，现欲将它们置入 Linux 系统中，路径显然已经发生变化。因此，我们须手工逐一修订它们，它们方可在 Linux 系统中正常运转。修订的过程非常简单易懂，但每个文件均需修订，故而这样的手工动作须重复多次。当然，你也可以借助工具批量查找和替换特定短语，达到快速高效的修订目的。

            **修订的核心是，将原本遵循 Windows 版【npm 工具】的文件夹安排的路径引用，改为遵循 Linux 版【npm 工具】的文件夹安排的路径引用。** 具体而言，要将所有文件中的所有 `/node_modules/` 替换为 `../lib/node_modules/`。

            现以 `verdaccio` 文件为例，来自 Windows 的原始内容全文如下：

            ```bash
            #!/bin/sh
            basedir=$(dirname "$(echo "$0" | sed -e 's,\\,/,g')")

            case `uname` in
                *CYGWIN*|*MINGW*|*MSYS*) basedir=`cygpath -w "$basedir"`;;
            esac

            if [ -x "$basedir/node" ]; then
            # 注意，下面这行中的路径须改动。
            "$basedir/node"  "$basedir/node_modules/verdaccio/bin/verdaccio" "$@"
            ret=$?
            else
            # 注意，下面这行中的路径须改动。
            node  "$basedir/node_modules/verdaccio/bin/verdaccio" "$@"
            ret=$?
            fi
            exit $ret
            ```

            应改为：

            ```bash
            #!/bin/sh
            basedir=$(dirname "$(echo "$0" | sed -e 's,\\,/,g')")

            case `uname` in
                *CYGWIN*|*MINGW*|*MSYS*) basedir=`cygpath -w "$basedir"`;;
            esac

            if [ -x "$basedir/node" ]; then
            # 注意，下面这行中，路径有所改动。
            "$basedir/node"  "$basedir/../lib/node_modules/verdaccio/bin/verdaccio" "$@"
            ret=$?
            else
            # 注意，下面这行中，路径有所改动。
            node  "$basedir/../lib/node_modules/verdaccio/bin/verdaccio" "$@"
            ret=$?
            fi
            exit $ret
            ``

    -   如果联网机上的操作系统是 Linux，而私有机的操作系统是 Windows，则参考上一条的做法，做一点研究，你一定会想出正确的做法的。


1.  配置 verdaccio。

    参阅：

    -   [https://verdaccio.org/docs/en/configuration](https://verdaccio.org/docs/en/configuration)。
    -   [https://verdaccio.org/docs/en/server-configuration#listening-on-all-addresses](https://verdaccio.org/docs/en/server-configuration#listening-on-all-addresses)。


    以下是一份 `config.yaml` 的示例，供参考。

    ```yml
        storage: /my-npm-verdaccio-storage
        plugins: ./plugins

        listen: 0.0.0.0:4873 # 这一行很重要！

        web:
            title: 我的内网 npm 服务
            max_body_size: 1000mb # 这一行很重要！

        i18n:
            web: zh-CN


        publish:
            allow_offline: true

        auth:
            htpasswd:
                file: ./htpasswd

        uplinks:
            npmjs:
                url: https://registry.npmjs.org/

        packages:
        #   '@*/*':
        #       access: $all
        #       publish: $authenticated
        #       unpublish: $authenticated
        #       proxy: npmjs

            '**':
                access: $anonymous
                publish: $anonymous
                unpublish: $anonymous
                # proxy: npmjs

        server:
            keepAliveTimeout: 60

        middlewares:
            audit:
                enabled: true

        logs:
            - { type: stdout, format: pretty, level: http }
    ```



1.  如果日常无法对私有机直接操控，而是须借助 SSH 连接，则我们有必要将 verdaccio 改造成“可以独立于 SSH 会话而恒久运行”。此处仅以私有机运行 Linux 系统为例。

    1.  用文本编辑器（例如 VIM）将 `/usr/local/lib/nodejs/node-v??.??.?-linux-x64/bin/verdaccio` 这一脚本文件打开，进行编辑。

    1.  将其中 `if` 语句的 `then` 分支和 `else` 分支中的语句均冠以 `nohup<空格>` ，再各以 `<空格>&` 结尾，使得该文件全文大致如下：

        ```bash
        #!/bin/sh
        basedir=$(dirname "$(echo "$0" | sed -e 's,\\,/,g')")
        echo $basedir
        case `uname` in
            *CYGWIN*|*MINGW*|*MSYS*) basedir=`cygpath -w "$basedir"`;;
        esac

        if [ -x "$basedir/node" ]; then
            # 注意，下面这行首、尾两处有改动。
            nohup  "$basedir/node"  "$basedir/../lib/node_modules/verdaccio/bin/verdaccio"  "$@"  &
        else
            # 注意，下面这行首、尾两处有改动。
            nohup            node   "$basedir/../lib/node_modules/verdaccio/bin/verdaccio"  "$@"  &
        fi
        exit $ret
        ```

    1.  保存该文件，并退出文本编辑器。


1.  配置私有机操作系统的网络防火墙，以使得 verdaccio 可以对外提供【npm 系统服务】。

    以 Linux 系统为例：

    ```bash
    firewall-cmd  --zone=public  --add-port=4873/tcp  --permanent
    firewall-cmd  --reload
    ```


1.  启动 verdaccio 服务。

    ```bash
    verdaccio
    ```


1.  如果私有机运行的操作系统是 Linux，则不妨在私有机上配置 `crontab`，以使得 verdaccio 服务程序（即 npm 注册点服务程序）在崩溃后全自动重启。

    参阅：

    -   [https://verdaccio.org/docs/en/server-configuration#keeping-verdaccio-running-forever](https://verdaccio.org/docs/en/server-configuration#keeping-verdaccio-running-forever)。



### 在一台内网工作计算机上验证 verdaccio 运转如期

打开浏览器，访问“`http://<私有机的主机名或IP地址>:4873/`”。


---


## 日常维护 npm 私有注册点，特别是向其追加【npm 包】

1.  《[在可连接互联网的计算机所做的准备工作](#在可连接互联网的计算机所做的准备工作)》。
1.  《[在可连接到 npm 私有服务器的任何内网计算机上的操作](#在可连接到-npm-私有服务器的任何内网计算机上的操作)》。



### 在可连接互联网的计算机所做的准备工作

-   在联网机上，从 npmjs 官方注册点采集的一批【npm 包】，以便稍后将它们批量转录仅我们的 npm 私有注册点。采集动作可以是不定期的，或依照现实需求临时发起的。

    具体做法以本人设计的“[wulechuan-bash-publish-npm-packages-in-batch](https://github.com/wulechuan/wulechuan-bash-publish-npm-packages-in-batch)”为例，如下：

    > 不必确保在联网机上的【npm 工具】的注册点指向淘宝注册点。因为“采集和转录脚本”工具中，“采集脚本”并不需要通过标准的 npm 命令来下载【npm 包】。它仅仅是通过拼接字符串构成的 URL 来下载【npm 包】对应的 tgz 文件而已。

    ```bash
    1-search-a-folder-and-download-all-tgz-files.sh   /d/develop/
    ```

    采集好的【npm 包】均会存放在 `/c/taobao-npm-tgz-caches/` 文件夹中。


-   将采集好的【npm 包】，从联网机中的缓存（`/c/taobao-npm-tgz-caches/`）转移（复制）到私有机（即 npm 私有注册点服务器）中去。



### 在可连接到 npm 私有服务器的任何内网计算机上的操作

1.  将新采集的 tgz 文件全部复制到某内网计算机的 `/c/taobao-npm-tgz-caches/` 文件夹下。该内网计算机既可以是用作搭建 npm 私有注册点的计算机本身，也可以是其他任意的可以连接 npm 私有注册点的内网计算机。

2.  运行“采集和转录脚本”工具中的“转录”脚本。具体如下：

    ```bash
    source  "<本工具路径>/2-scan-cached-tgz-files-and-publish-them.sh"
    ```



---



## 在内网计算机上管理和使用 npm 私有注册点中的【npm 包】


### 一次性的准备工作

将该工作站的 npm 注册点由默认的官方注册点改为你的私有注册点。

```bash
npm  set  registry  http://<私有机的主机名或IP地址>:4873/
```




### 将 npm 包发布到私有注册点的试验

```bash
mkdir -p <你习惯的工作文件夹>/<试验包的名称>
cd       <你习惯的工作文件夹>/<试验包的名称>
npm  init
npm  publish
```

示例：

```bash
mkdir  -p  /d/develop/my-npm-dummy-pack/
cd         /d/develop/my-npm-dummy-pack/
npm  init
npm  publish
```



### 查阅已发布的试验包

#### 方法一：借助 Web 服务页面

[http://localhost:4873/my-npm-dummy-pack](http://localhost:4873/my-npm-dummy-pack)。


#### 方法二：借助【npm 工具】

```bash
npm  search  my-npm-dummy-pack
```

