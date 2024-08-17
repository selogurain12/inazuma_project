import ReactDOM from 'react-dom/client'
import App from './components/index.tsx'
import './css/index.css'
import "slick-carousel/slick/slick.css";
import "slick-carousel/slick/slick-theme.css";
import { StrictMode } from 'react'
import { BrowserRouter, Route, Routes } from 'react-router-dom'
import HomePersonnage from './components/personnages/home-personnages.tsx'
import { PersonnageFormulaire } from './components/personnages/personnage-form.tsx'
import { AllPersonnages } from './components/personnages/list-all-personnage.tsx'
import { PersonnageDetails } from './components/personnages/personnage-detail.tsx'
import { PersonnageEdit } from './components/personnages/personnage-edit.tsx';
import HomeEquipe from './components/equipes/home-equipes.tsx';
import { EquipeFormulaire } from './components/equipes/equipe-form.tsx';
import { AllEquipes } from './components/equipes/list-all-equipes.tsx';
import { EquipeDetails } from './components/equipes/equipe-detail.tsx';
import { EquipeEdit } from './components/equipes/equipe-edit.tsx';
import HomeEpisode from './components/episodes/home-episode.tsx';
import { EpisodeFormulaire } from './components/episodes/episode-form.tsx';
import { AllEpisodes } from './components/episodes/list-all-episodes.tsx';
import { EpisodeDetails } from './components/episodes/episode-detail.tsx';
import { EpisodeEdit } from './components/episodes/episode-edit.tsx';

  ReactDOM.createRoot(document.getElementById('root')!).render(
    <StrictMode>
      <main>
        <BrowserRouter>
          <Routes>
            <Route element={<App />} index path="/" />
            <Route element={<HomePersonnage />} path="/personnages" />
            <Route element={<PersonnageFormulaire />} path="/personnages/createPersonnage" />
            <Route element={<AllPersonnages />} path="/personnages/listPersonnages" />
            <Route element={<PersonnageDetails />} path="/personnages/listPersonnages/:id" />
            <Route element={<PersonnageEdit />} path="/personnages/editPersonnages/:id" />
            <Route element={<HomeEquipe />} path="/equipes" />
            <Route element={<EquipeFormulaire />} path="/equipes/createEquipe" />
            <Route element={<AllEquipes />} path="/equipes/listEquipes" />
            <Route element={<EquipeDetails />} path="/equipes/listEquipes/:id" />
            <Route element={<EquipeEdit />} path="/equipes/editEquipes/:id" />
            <Route element={<HomeEpisode />} path="/episodes" />
            <Route element={<EpisodeFormulaire />} path="/episodes/createEpisode" />
            <Route element={<AllEpisodes />} path="/episodes/listEpisodes" />
            <Route element={<EpisodeDetails />} path="/episodes/listEpisodes/:id" />
            <Route element={<EpisodeEdit />} path="/episodes/editEpisodes/:id" />
          </Routes>
        </BrowserRouter>
      </main>
    </StrictMode>,
  )
