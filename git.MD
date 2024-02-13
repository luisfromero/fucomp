# GitHub

GitHub es una plataforma en línea para alojar y revisar proyectos de software utilizando el sistema de control de versiones Git. La plataforma proporciona herramientas para colaborar y coordinar el trabajo de los equipos de desarrollo de software, incluyendo características como el seguimiento de problemas, la gestión de proyectos y la revisión de código. GitHub también ofrece integración con otros servicios populares, como Travis CI y Slack, para simplificar el flujo de trabajo de desarrollo. GitHub es ampliamente utilizado por la comunidad de código abierto, pero también se utiliza en entornos empresariales y para proyectos privados.

En resumen, GitHub es una plataforma en línea que ofrece herramientas para alojar y gestionar proyectos de software utilizando Git, y que se utiliza ampliamente en la comunidad de código abierto y en entornos empresariales para la colaboración y el control de versiones de software.

### crear repositorio remoto en la web, sin readme

* Abrir una cuenta en github u otra plataforma (bitbucket, gitlab)
    (por ejemplo, luisfromero)
* Crear un repositorio vacío 
    (por ejemplo, fucomp)

## Instalar git y establecer usuario y contraseña

C:\Windows\System32>git config --global user.email felipe@uma.es
C:\Windows\System32>git config --global user.name luisfromero
C:\Windows\System32>git config --global user.password ********
En VSCode pedirá también la autenticación

## Ejecutar la siguiente secuencia en un terminal para crear un repositorio



```cs
git init .
git add .
git commit -m "primer commit"
git branch -M main
git remote add origin https://github.com/luisfromero/fucomp
git push -u origin main 
```

## Si necesita reiniciar el repositorio

git init .
git remote rm origin
