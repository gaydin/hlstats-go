{{ template "base/head" . }}
<div class="page-ath-form">
	<h2 class="page-ath-heading">Авторизация
		<small>user panel</small>
	</h2>
	<form class="m-t-40" method="post" action="/admin/auth" id="loginform" novalidate>
		<div class="input-item">
			<input class="input-bordered" id="name" name="login" type="text" required="" placeholder="Username">
		</div>

		<div class="input-item">
			<input class="input-bordered" id="passwod" name="password" type="password" required=""
				   placeholder="Password">
		</div>
		<div class="d-flex justify-content-between align-items-center">
			<div class="input-item text-left">
				<input class="input-checkbox input-checkbox-md" name="remember" id="remember-me" type="checkbox" value="true">
				<label for="remember-me">Запомнить меня</label>
			</div>
			<div>
				<a href="forgot">Забыли пароль?</a>
				<div class="gaps-2x"></div>
			</div>
		</div>

		<button class="btn btn-primary btn-block" type="submit">Войти</button>
	</form>
	<div class="sap-text"><span></span></div>
	<ul class="row guttar-20px guttar-vr-20px">
		<li class="col"><a href="/auth/o/login/github" class="btn btn-outline btn-dark btn-github btn-block"><em
						class="fab fa-github"></em><span>Github</span></a></li>
	</ul>
</div>
{{ template "base/footer" . }}