const config = {
  development: {
    baseUrl: 'http://localhost:3000/api',
    ingredientsUrl: '/ingredients',
    recipesUrl: '/recipes'
  }
}

module.exports = config['development']