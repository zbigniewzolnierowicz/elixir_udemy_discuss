import {Socket} from "phoenix"

export const socket = new Socket("/socket", {params: {token: window.userToken}})
socket.connect()

export const wsPrefixer = (content) => `comments:${content}`
