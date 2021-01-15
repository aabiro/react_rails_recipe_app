import React, { useState, useEffect } from "react";
import ListGroup from "react-bootstrap/ListGroup";
import Card from "react-bootstrap/Card";
import Config from '../components/services/config';
import { getHeaders } from '../components/services/Api';
import axios from "axios";

const RecipeList = ({ ingredientIds }) => {
    const [recipes, setRecipes] = useState([]);

    const listrecipes = () => {
        if (recipes.length < 1) {
            return <>No recipes found, try changing your ingredients!</>;
        } else {
            return (
                <div>
                {recipes.map(r => (
                <ListGroup key={r.id}>
                  <ListGroup.Item>
                    <Card className="mb-3">
                      <Card.Header>{r.name}</Card.Header>
                      <Card.Body>ID = {r.id}</Card.Body>
                    </Card>
                  </ListGroup.Item>
                </ListGroup>
                ))}</div>
              );
        }
    };

    useEffect(() => {
        const loadRecipes = async () => {
            axios.post(`${Config.baseUrl}${Config.recipesUrl}`, ingredientIds, { headers: getHeaders() }).then((response) => {
                console.log(response.data),
                setRecipes(response.data);
            })
        };
        loadRecipes();      
    }, [ingredientIds]);

    return (
        listrecipes()
    );
};

export default RecipeList;
