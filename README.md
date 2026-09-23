# 3D 世界地图（可编辑球形政区图）

一个基于 globe.gl / Three.js 的 3D 可交互世界地图，支持球形与平面两种视图，可点选国家及其一级行政区进行编辑。

**在线预览**：https://jijihuanhuan.github.io/3Dmap/

## 功能特性

- 球形 / 平面两种视图切换
- 点选国家、行政区，修改颜色、名称、备注
- **点击任意国家（或从左侧列表选择）展开其下辖行政区**（州 / 省 / 郡 / 县），再次点击或点「收起行政区」恢复国家轮廓
- 中国默认展开 34 个省级行政区
- 北极圈、南极圈、四大洋标注
- 钉标记；编辑内容保存在浏览器本机（localStorage）
- 导出 / 导入 JSON 配置

## 文件结构

| 文件 | 说明 |
| --- | --- |
| `index.html` | 前端页面（网站首页，依赖 CDN） |
| `china-provinces.json` | 中国 34 个省级行政区边界 |
| `world-states.json` | 全球 241 个国家和地区的一级行政区边界（约 4600 个） |
| `启动.bat` | Windows 一键启动脚本 |
| `使用说明.txt` | 本地使用说明 |

## 运行方式

**Windows 一键启动**

1. 双击「启动.bat」（需已安装 Python 3）
2. 浏览器自动打开 http://127.0.0.1:8760/index.html

**手动启动**：在本目录下运行任意静态文件服务器，例如：

```bash
python -m http.server 8760 --bind 127.0.0.1
```

然后访问 `http://127.0.0.1:8760/index.html`。

> 注意：不要直接用文件资源管理器双击 `index.html`，浏览器会因本地文件访问限制拦截 JSON 加载。

## 在线部署（GitHub Pages）

仓库已配置 GitHub Pages（部署 `main` 分支根目录），访问：

https://jijihuanhuan.github.io/3Dmap/

## 行政区数据

- 来源：Natural Earth 10m admin-1（States, Provinces），公有领域
- 已用 mapshaper 简化为 TopoJSON（约 1.6 MB），按需展开渲染，不影响初始加载速度
- 覆盖 241 个国家 / 地区，如美国 51 州、英国 232 行政区、法国 101 省、德国 16 州、日本 47 县等
- 少数争议地区（北塞浦路斯、索马里兰等）无一级行政区数据，保持国家级别显示
- 中国省份使用独立的 `china-provinces.json`（34 个省级行政区）

## 技术说明

- 3D 地球：globe.gl（基于 Three.js）
- 数据处理：D3.js、topojson-client
- 世界政区、地球贴图等资源从 CDN（jsdelivr）加载，首次打开需联网

## 数据保存

编辑结果保存在浏览器 localStorage 中，可通过页面上的导出 / 导入功能备份和恢复 JSON 配置。
