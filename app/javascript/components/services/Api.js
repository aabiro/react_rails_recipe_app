import axios from 'axios';
import Config from '../services/config';

function getHeaders() {
    return ({
        'Accept': 'application/json',
        'Content-Type': 'application/json'
    });
};

function getRecipes(ingredientIds) {
    const url = `${Config.baseUrl}${Config.recipesUrl}`;
    return axios.post(url, ingredientIds, { headers: getHeaders() })
        .then(function (response) {
            console.log(response.data);
            return response.data;
        });
};

function getIngredients() {
    const url = `${Config.baseUrl}${Config.ingredientsUrl}`;
    return axios.get(url);
};

export {
    getHeaders,
    getRecipes,
    getIngredients
}