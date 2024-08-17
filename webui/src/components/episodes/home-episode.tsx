import { Box, Typography } from "@mui/material";
import {MenuEpisode} from "./menu-episodes";

export default function HomeEpisode() {
  return (
    <Box sx={{ 
      height: "100vh", 
      display: "flex", 
      flexDirection: "row", 
      paddingLeft: "5px" 
      }}>
      <MenuEpisode />
      <Box sx={{ flexGrow: 1, display: "flex", flexDirection: "column", alignItems: "center" }}>
        <Typography variant="h3" gutterBottom>
          EPISODES
        </Typography>
      </Box>
    </Box>
  );
}
