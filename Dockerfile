FROM node:11.3

ENV server_work_dir /opt/api-front-server
ENV server_dir ${server_work_dir}/server/server.js

# Angular CLIインストール
RUN npm install -g @angular/cli@7.1.1

# モジュール配置
RUN mkdir -p ${server_work_dir}
COPY . ${server_work_dir}/.

# 作業ディレクトリ移動
RUN ls -l ${server_work_dir}
WORKDIR ${server_work_dir}
RUN pwd

# Expressインストール
RUN npm install --save express

# 環境のCPUアーキテクチャによってエラーが発生するため、そのマシンにあったものを再度ダウンロード
RUN npm rebuild node-sass

# ビルド
RUN ng build --prod

# ポート解放
#EXPOSE 3000
CMD ["node", "/opt/api-front-server/server/server.js"]