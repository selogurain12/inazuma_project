import { Box, Grid } from "@mui/material";
import { makeStyles, ButtonBase, Typography } from '@material-ui/core';
import { Link } from "react-router-dom";

const images = [
  {
    url: '../src/assets/mark_evans.png',
    title: 'Personnages',
    width: '100%',
  },
  {
    url: '../src/assets/raimon.png',
    title: 'Equipes',
    width: '100%',
  },
  {
    url: '../src/assets/episode.png',
    title: 'Episodes',
    width: '100%',
  },
  {
    url: '../src/assets/supertechnique.png',
    title: 'Supertechniques',
    width: '100%',
  },
  {
    url: '../src/assets/supertactique.png',
    title: 'Supertactique',
    width: '100%',
  },
  {
    url: '../src/assets/match.png',
    title: 'Matchs',
    width: '100%',
  },
  {
    url: '../src/assets/serie.png',
    title: 'Séries',
    width: '100%',
  },
  {
    url: '../src/assets/image.png',
    title: 'Images',
    width: '100%',
  },
];

const useStyles = makeStyles((theme: { breakpoints: { down: (arg0: string) => string; }; palette: { common: { white: string; black: string; }; }; transitions: { create: (arg0: string) => string; }; spacing: (arg0: number) => number; }) => ({
  root: {
    display: 'flex',
    flexWrap: 'wrap',
    minWidth: 500,
    width: '100%',
  },
  image: {
    position: 'relative',
    height: 200,
    [theme.breakpoints.down('xs')]: {
      width: '100% !important',
      height: 100,
    },
    '&:hover, &$focusVisible': {
      zIndex: 1,
      '& $imageBackdrop': {
        opacity: 0.15,
      },
      '& $imageMarked': {
        opacity: 0,
      },
      '& $imageTitle': {
        border: '4px solid currentColor',
      },
    },
    paddingLeft: 2,
  },
  focusVisible: {},
  imageButton: {
    position: 'absolute',
    left: 0,
    right: 0,
    top: 0,
    bottom: 0,
    display: 'flex',
    alignItems: 'center',
    justifyContent: 'center',
    color: theme.palette.common.white,
  },
  imageSrc: {
    position: 'absolute',
    left: 0,
    right: 0,
    top: 0,
    bottom: 0,
    backgroundSize: 'cover',
    backgroundPosition: 'center 40%',
  },
  imageBackdrop: {
    position: 'absolute',
    left: 0,
    right: 0,
    top: 0,
    bottom: 0,
    backgroundColor: theme.palette.common.black,
    opacity: 0.4,
    transition: theme.transitions.create('opacity'),
  },
  imageTitle: {
    position: 'relative',
    padding: `${theme.spacing(2)}px ${theme.spacing(4)}px ${theme.spacing(1) + 6}px`,
  },
  imageMarked: {
    height: 3,
    width: 18,
    backgroundColor: theme.palette.common.white,
    position: 'absolute',
    bottom: -2,
    left: 'calc(50% - 9px)',
    transition: theme.transitions.create('opacity'),
  },
}));

export default function ButtonSelect() {
  const classes = useStyles();
  return (
    <Box sx={{
      display: "flex",
      justifyContent: "center",
      alignItems: "center",
      height: "100%"
    }}>
      <Grid container spacing={{ xs: 2, md: 3 }} columns={{ xs: 3, sm: 8, md: 12 }}>
        <div className={classes.root}>
          {images.map((image) => (
            <Grid item xs={6} sm={4} md={3} key={image.title} sx={{ paddingLeft: "12px", paddingBottom: "12px" }}>
              <Link to={`/${image.title.toLowerCase()}`}>
                <ButtonBase
                  focusRipple
                  className={classes.image}
                  focusVisibleClassName={classes.focusVisible}
                  style={{
                    width: image.width,
                  }}
                >
                  <span
                    className={classes.imageSrc}
                    style={{
                      backgroundImage: `url(${image.url})`,
                    }}
                  />
                  <span className={classes.imageBackdrop} />
                  <span className={classes.imageButton}>  
                    <Typography
                      component="span"
                      variant="subtitle1"
                      color="inherit"
                      className={classes.imageTitle}
                    >
                      {image.title}
                      <span className={classes.imageMarked} />
                    </Typography>
                  </span>
                </ButtonBase>
              </Link>
            </Grid>
          ))}
        </div>
      </Grid>
    </Box>
  );
}
