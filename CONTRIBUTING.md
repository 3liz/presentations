# Contributions

## Rules

Please follow [slug conventions](https://en.wikipedia.org/wiki/Clean_URL#Slug) for naming files :

- Use `-`
- Use latin letters and numbers in lowercase
- use the `events` folder for files related to a specific event, such as FOSS4G etc

Do not forget to update docs.3liz.org otherwise, your presentation won't be visible on the website.
The markdown file to edit is https://github.com/3liz/3liz.github.io/blob/master/docs/talks.md

## Reveal autoSlide

For presentations based on reveal yan can add parameters to initialize:

```js
                autoSlide: 5000,
                loop: true,
```

For exemple at the end of your presentation you will have

```js
// More info about initialization & config:
// - https://revealjs.com/initialization/
// - https://revealjs.com/config/
Reveal.initialize({
    controls: true,
    progress: true,
    history: true,
    center: true,
    autoSlide: 5000,
    loop: true,

    transition: 'slide',
    plugins: [ RevealMarkdown, RevealHighlight, RevealNotes ]
});
```
