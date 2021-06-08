import "phoenix_html"
import { wsPrefixer, socket } from "./socket"

const createChannel = (id) => {
    const channel = socket.channel(wsPrefixer(id), {})
    channel.join()
        .receive("ok", resp => { console.log("Joined successfully", resp) })
        .receive("error", resp => { console.log("Unable to join", resp) })

    document.querySelector('button#ping').addEventListener('click', () => {
        channel.push(wsPrefixer("pong"), { foo: 'pong' })
    })
}

window.createChannel = createChannel