
FROM node:12

ARG MDX_DECK_VERSION

WORKDIR /home/node/mdx-deck
RUN chown node:node /home/node/mdx-deck

USER node
COPY package.json .
RUN bash -c "sed -i 's/MDX_DECK_VERSION/$MDX_DECK_VERSION/g' package.json"
RUN npm install

CMD npm start






# # Copies in our code and runs NPM Install
# FROM node:12 as builder
# ARG MDX_DECK_VERSION
# WORKDIR /home/node/app
# RUN chown node:node /home/node/app
# USER node
# COPY package.json .
# RUN bash -c "sed -i 's/MDX_DECK_VERSION/$MDX_DECK_VERSION/g' package.json"
# RUN npm install


# # # Starts and Serves Web Page
# # FROM node:12 as serve
# # WORKDIR /home/node/app
# # COPY --from=builder /home/node/app/package* ./
# # COPY --from=builder /home/node/app/node_modules* ./
# RUN npm start