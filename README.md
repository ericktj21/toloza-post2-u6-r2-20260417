# U6 PostContenido 2 - MVC con Autenticacion, Validaciones e i18n

Extension de U6 Post 1 con login, control de sesion, validaciones por campo y cambio de idioma.

## Requisitos
- Java 11+ (recomendado 17)
- Maven 3.8+
- Tomcat 10.x

## Credenciales
- admin / Admin123!
- viewer / View456!

## Ejecutar
1. Compilar:
   ```bash
   mvn clean package
   ```
2. Desplegar `target/mvc-productos-auth-i18n-1.0-SNAPSHOT.war` en Tomcat.
3. Abrir:
   `http://localhost:8080/mvc-productos-auth-i18n/login`

## Funcionalidades
- Proteccion de `/productos` por sesion
- Login/logout con `HttpSession`
- Selector de idioma Espanol/English
- Validaciones de formulario por campo

## Entrega GitHub
Nombre sugerido: `apellido-post2-u6`
