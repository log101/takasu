import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'
import {useState, useEffect} from "react";
import axios from 'axios'

const App = (props) => {

    return <SearchForm />
}

const SearchResults = (props) => props.results.map(item => <p>{item}</p>)

const SearchForm = (props) => {
    const [newSearch, setNewSearch] = useState("")
    const [newResult, setNewResult] = useState({result: []})


    const submitHandler = (event) => {
        event.preventDefault()
        axios
            .get(`http://localhost:3000/search?query=${newSearch}`)
            .then(res => setNewResult(res.data))
    }

    const getMangas = () => {
        return axios
                .get(`http://localhost:3000/search?query=${newSearch}`)
                .then(res => setNewResult(res.data))
    }

    const changeHandler = (event) => {
        setNewSearch(event.target.value)
        getMangas()
    }

    return (
        <div>
            <p>newSearch {newSearch}</p>
            <p>results {newResult.result}</p>
            <form onSubmit={submitHandler}>
                <input value={newSearch} onChange={changeHandler}/>
                <button type="submit">search</button>
            </form>
            <SearchResults results={newResult.result} />
        </div>)
}

document.addEventListener('DOMContentLoaded', () => {
    ReactDOM.render(
        <App/>,
        document.getElementById("search-form")
    )
})
