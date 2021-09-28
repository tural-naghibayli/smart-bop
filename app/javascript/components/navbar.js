const initUpdateNavbarOnScroll = () => {
  const navbar = document.querySelector('.navbar-xspace');
  if (navbar) {
    window.addEventListener('scroll', () => {
      if (window.scrollY >= window.innerHeight) {
        navbar.classList.add('navbar-xspace-white');
      } else {
        navbar.classList.remove('navbar-xspace-white');
      }
    });
  }
}

export { initUpdateNavbarOnScroll };
