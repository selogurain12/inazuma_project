import { Box, Button, IconButton, Drawer, List, ListItem } from "@mui/material";
import MenuIcon from '@mui/icons-material/Menu';
import { useState, KeyboardEvent, MouseEvent } from "react";
import { Link } from "react-router-dom";

export function MenuEquipe() {
  const [drawerOpen, setDrawerOpen] = useState(false);

  const toggleDrawer = (open: boolean) => (event: KeyboardEvent | MouseEvent) => {
    if (
      event.type === 'keydown' &&
      ((event as KeyboardEvent).key === 'Tab' || (event as KeyboardEvent).key === 'Shift')
    ) {
      return;
    }
    setDrawerOpen(open);
  };

  const drawerContent = (
    <Box
      sx={{ width: 280 }}
      role="presentation"
      onClick={toggleDrawer(false)}
      onKeyDown={toggleDrawer(false)}
    >
      <List>
        <ListItem>
          <Link to={'/equipes/createEquipe'}>
            <Button color="inherit">Créer une équipe</Button>
          </Link>
        </ListItem>
        <ListItem>
          <Link to={'/equipes/listEquipes'}>
            <Button color="inherit">Voir toutes les équipes</Button>
          </Link>
        </ListItem>
      </List>
    </Box>
  );

  return (
    <Box>
      <IconButton
        edge="start"
        color="inherit"
        aria-label="menu"
        onClick={toggleDrawer(true)}
      >
        <MenuIcon />
      </IconButton>
      <Drawer
        anchor="left"
        open={drawerOpen}
        onClose={toggleDrawer(false)}
      >
        {drawerContent}
      </Drawer>
    </Box>
  );
}
