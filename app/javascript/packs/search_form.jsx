import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'
import {useState, useEffect} from "react";
import axios from 'axios'

const App = (props) => {

    return <SearchForm/>
}

const SearchResults = (props) => {
    const searchResults = props.results
        .map(res => <a key={res.id} className="manga-search-link" href={res.link}><p>{res.title}</p></a>)
    if (props.searchFilter === "") {
        return <div>
            <p>Recommandations</p>
            <div>{searchResults}</div>
        </div>
    } else {
        return props.results
            .map(res => <a key={res.id} className="manga-search-link" href={res.link}><p>{res.title}</p></a>)
    }
}

const SearchForm = (props) => {
    const [newSearch, setNewSearch] = useState("")
    const [newResult, setNewResult] = useState({results: []})

    const getMangas = (search) => {
        return axios
            .get(`/search?query=${search}`)
            .then(res => setNewResult(res.data))
    }

    const changeHandler = (event) => {
        setNewSearch(event.target.value)
        getMangas(event.target.value)
    }

    useEffect(() => { getMangas ("") }, [])

    return (
        <div>
            <form>
                <input id="search-bar" value={newSearch} onChange={changeHandler}/>
                <button type="submit">search</button>
            </form>
            <SearchResults results={newResult.results} searchFilter={newSearch}/>
        </div>)
}

ReactDOM.render(
    <App/>,
    document.getElementById("search-form"))
