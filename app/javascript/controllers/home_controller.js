import { Controller } from "stimulus"
export default class extends Controller {
    static targets = ["name", "notice"]

    connect() {
        setTimeout(() => {
            this.noticeTarget.classList.add("uk-invisible", "uk-animation-fade")
        }, 2000);
    }

}