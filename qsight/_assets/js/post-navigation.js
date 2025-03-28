// assets/js/post-navigation.js
document.addEventListener("DOMContentLoaded", function() {
  const posts = [
    {{#posts}}
    {
      title: "{{title}}",
      url: "{{url}}",
      date: "{{date}}"
    },
    {{/posts}}
  ];

  const currentUrl = window.location.pathname;
  let currentIndex = posts.findIndex(post => post.url === currentUrl);

  if (currentIndex > 0) {
    const prevPost = posts[currentIndex - 1];
    document.querySelector('.prev-post').innerHTML = `
      <a href="${prevPost.url}">← ${prevPost.title}</a>
    `;
  }

  if (currentIndex < posts.length - 1) {
    const nextPost = posts[currentIndex + 1];
    document.querySelector('.next-post').innerHTML = `
      <a href="${nextPost.url}">${nextPost.title} →</a>
    `;
  }
});
