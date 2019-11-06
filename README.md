![GitHub top language](https://img.shields.io/github/languages/top/luftkluft/plantik)
![GitHub repo size](https://img.shields.io/github/repo-size/luftkluft/plantik)
![GitHub](https://img.shields.io/github/license/luftkluft/plantik)
![GitHub package.json version (branch)](https://img.shields.io/github/package-json/v/luftkluft/plantik/master)
![GitHub release (latest by date)](https://img.shields.io/github/v/release/luftkluft/plantik)
![GitHub last commit](https://img.shields.io/github/last-commit/luftkluft/plantik)
[![Build Status](https://circleci.com/gh/luftkluft/plantik.svg?branch=master)](https://circleci.com/gh/luftkluft/plantik)
# plantik
plantik MES (develop)


# Group Plantik_API


## Admin [/api/v1/admin]


### Redirect to activeadmin [GET /api/v1/admin]


+ Request return status code 302
**GET**&nbsp;&nbsp;`/api/v1/admin`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5

+ Response 302

    + Headers

            Content-Type: text/html; charset=utf-8

    + Body

            <html><body>You are being <a href="localhost:3000/admin">redirected</a>.</body></html>
