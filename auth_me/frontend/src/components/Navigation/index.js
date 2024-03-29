import ProfileButton from "./ProfileButton";
import React from 'react';
import { NavLink } from 'react-router-dom';
import { useDispatch, useSelector } from 'react-redux';
import './Navigation.css'



const Navigation = () => {
    const sessionUser = useSelector((state) => state.session.user)

    let sessionLinks
    if (sessionUser) {
        sessionLinks = (
            <ProfileButton user={sessionUser} />
        )
    } else {
        sessionLinks = (
            <>
                <NavLink to='/login'>Log In</NavLink>
                <NavLink to='/signup'>Sign Up</NavLink>
            </>
        )
    }

    return (
        <ul>
            <li>
                <NavLink exact to='/'>Home</NavLink>
                {sessionLinks}
            </li>
        </ul>
    )
}

export default Navigation;