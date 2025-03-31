FROM mcr.microsoft.com/playwright:v1.51.1-noble

RUN echo "=====> install tools"
RUN apt-get update
RUN apt-get dist-upgrade -y

RUN echo "=====> check npm/node version"
RUN npm --version
RUN yarn --version
RUN node -v

RUN apt-get install -y vim libgtk2.0-0 libgtk-3-0 libgbm-dev libnotify-dev libnss3 libxss1 libxtst6 xauth unzip
RUN apt-get install zip jq curl -y

RUN apt-get install python3 python3-venv python3-pip -y
RUN apt-get install python-is-python3 -y
RUN python --version
RUN pip --version

RUN echo "=====> copy source files"
RUN mkdir /demosynpress
COPY . /demosynpress/

WORKDIR /demosynpress
RUN rm -rf node_modules
RUN echo "=====> install all packages"
RUN yarn
RUN yarn playwright install

RUN rm -rf /var/lib/apt/lists/* /var/cache/apt/*