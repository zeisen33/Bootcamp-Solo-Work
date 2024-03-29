import { useState } from "react"
import { useDispatch } from "react-redux"
import { Redirect, useLocation } from "react-router-dom"
import { createBench } from "../../store/benches"

const BenchForm = () => {
    const dispatch = useDispatch

    const [title, setTitle] = useState('')
    const [price, setPrice] = useState()
    const [description, setDescription] = useState('')
    const [seating, setSeating] = useState()
    const [errors, setErrors] = useState([])
    const location = useLocation()

    const splitLoc = location.search.indexOf('.')
    const lat = location.search.slice(1, splitLoc)
    const lng = location.search.slice(splitLoc)

    const changeTitle = (e) => {
        e.preventDefault();
        setTitle(e.target.value)
    }
    const changePrice = (e) => {
        e.preventDefault();
        setPrice(e.target.value)
    }
    const changeDescription = (e) => {
        e.preventDefault();
        setDescription(e.target.value)
    }
    const changeSeating = (e) => {
        e.preventDefault();
        setSeating(e.target.value)
    }

    const handleSubmit = () => {
        debugger
        const newBench = dispatch(createBench({title, price, description, seating, lat, lng}))
        debugger

        if (newBench.errors) {
            errors.map((error) => {
                return <ul>{error.full_messages}</ul>
            })
        } else {
            <Redirect to='/' />
        }
    }

    // debugger

    return (
        <>
            <h1>Hello from BenchForm</h1>
            <form onSubmit={handleSubmit}>
                <label>Title
                    <input 
                        type='text'
                        value={title}
                        onChange={changeTitle}
                    />
                </label>
                <label>Price
                    <input 
                        type='number'
                        value={price}
                        onChange={changePrice}
                    />
                </label>
                <label>Description
                    <textarea value={description} onChange={changeDescription} >
                        
                    </textarea>
                </label>
                <label>Number of Seats
                    <input 
                        type='number'
                        value={seating}
                        onChange={changeSeating}
                    />
                </label>
                <label>Latitude
                    <input 
                        type='number'
                        value={lat}
                        disabled
                    />
                </label>
                <label>Longitude
                    <input 
                        type='number'
                        value={lng}
                        disabled
                    />
                </label>
                <button type='submit'>Submit Bench</button>
            </form>
        </>

    )
}

export default BenchForm;