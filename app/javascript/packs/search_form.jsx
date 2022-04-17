import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'
import {useState, useEffect} from "react";
import axios from 'axios'

const App = (props) => {

    return <SearchForm/>
}

const SearchResults = (props) => {
    if (props.searchFilter === "") return <p></p>
    else {
        return props.results
            .filter(res => res.toLowerCase().startsWith(props.searchFilter))
            .map(res => <p key={res}>{res}</p>)
    }
}

const SearchForm = (props) => {
    const [newSearch, setNewSearch] = useState("")
    const [newResult, setNewResult] = useState({results: []})

    const getMangas = () => {
        return axios
            .get(`http://localhost:3000/search?query=`)
            .then(res => setNewResult(res.data))
    }

    const changeHandler = (event) => {
        setNewSearch(event.target.value)
    }

    useEffect(() => { getMangas () }, [])

    return (
        <div>
            <form>
                <input value={newSearch} onChange={changeHandler}/>
                <button type="submit">search</button>
            </form>
            <SearchResults results={newResult.results} searchFilter={newSearch}/>
        </div>)
}

ReactDOM.render(
    <App/>,
    document.getElementById("search-form"))
