import {Brick} from "zengular";
import twig    from "./login.twig";
import "./login.scss";
import {Ajax}  from "zengular-util";

@Brick.register('login', twig)
export default class extends Brick {

	onInitialize() {
		this.query = JSON.parse(this.root.innerHTML);
	}


	createViewModel() {
		return {title: this.dataset.title}
	}

	onRender() {
		this.$$('form').listen('submit', event => {
			this.$$('error').node.classList.remove('active');
			event.preventDefault();
			let data = {
				login: this.$$('input-login').node.value,
				password: this.$$('input-password').node.value,
				app: this.dataset.app
			};
			Ajax.json('/api/auth/login', data).getJson
				.then(xhr => {
					if (xhr.status === 200) {
						let url = xhr.response.url;
						if (typeof this.query === 'object') {
							for (let key in this.query) if (this.query.hasOwnProperty(key)) {
								url = url.replace('{{' + key + '}}', this.query[key]);
							}
						}
						document.location.href = url;
					} else {
						this.$$('error').node.classList.add('active');
					}
				});
		});
	}

}